## tcpdump

El comando `tcpdump` es una herramienta de línea de comandos muy poderosa utilizada para capturar y analizar paquetes de red en sistemas Unix/Linux. Es ideal tanto para diagnóstico de redes como para análisis de seguridad.

---

## 🔧 **Sintaxis básica**
```bash
sudo tcpdump [opciones] [expresión de filtro]
```

> **Nota:** Necesitas permisos de superusuario (`sudo`) para usar `tcpdump`.

---

## 📌 Ejemplos básicos

### 1. **Capturar todos los paquetes en todas las interfaces**
```bash
sudo tcpdump
```
> Esto muestra los primeros paquetes que pasan por la interfaz activa por defecto (normalmente `eth0` o `enpXsY`).

---

### 2. **Listar todas las interfaces disponibles**
```bash
sudo tcpdump -D
```
Ejemplo salida:
```
1.eth0
2.wlan0
3.any
4.lo
```

---

### 3. **Capturar paquetes en una interfaz específica**
```bash
sudo tcpdump -i eth0
```
> Reemplaza `eth0` por el nombre de tu interfaz de red.

---

### 4. **Mostrar paquetes en formato legible**
```bash
sudo tcpdump -nn -i eth0
```
- `-n`: No resuelve nombres de host.
- `-nn`: No resuelve ni nombres de host ni puertos (muestra IPs y números de puerto directamente).

---

### 5. **Guardar la captura en un archivo `.pcap`**
```bash
sudo tcpdump -i eth0 -w salida.pcap
```
> Puedes abrir este archivo con Wireshark o analizarlo más tarde con `tcpdump`.

---

### 6. **Leer desde un archivo `.pcap`**
```bash
sudo tcpdump -r salida.pcap
```

---

## 🔍 Filtros avanzados

Puedes filtrar tráfico por IP, puerto, protocolo, etc.

### 7. **Filtrar por dirección IP**
```bash
sudo tcpdump host 192.168.1.1 -i eth0
```
> Muestra paquetes que involucran a la IP `192.168.1.1`.

También puedes filtrar solo origen o destino:
```bash
sudo tcpdump src 192.168.1.1 -i eth0    # Solo paquetes de origen
sudo tcpdump dst 192.168.1.1 -i eth0    # Solo paquetes de destino
```

---

### 8. **Filtrar por puerto**
```bash
sudo tcpdump port 80 -i eth0
```
> Captura tráfico HTTP (puerto 80).

Para ver solo tráfico SSH:
```bash
sudo tcpdump port 22 -i eth0
```

---

### 9. **Filtrar por protocolo**
```bash
sudo tcpdump tcp -i eth0
```
> Solo tráfico TCP.

Otros protocolos válidos: `udp`, `icmp`, `arp`, etc.

---

### 10. **Combinar filtros con AND / OR / NOT**
```bash
sudo tcpdump "tcp and port 80 and host 192.168.1.1" -i eth0
```
> Captura tráfico TCP en el puerto 80 proveniente o dirigido a `192.168.1.1`.

Ejemplo con NOT:
```bash
sudo tcpdump "not port 22" -i eth0
```
> Captura todo excepto tráfico SSH.

---

### 11. **Limitar número de paquetes capturados**
```bash
sudo tcpdump -c 5 -i eth0
```
> Captura solo 5 paquetes y termina.

---

### 12. **Mostrar contenido ASCII de los paquetes**
```bash
sudo tcpdump -A -i eth0 port 80
```
> Útil para ver texto plano en el payload del paquete (por ejemplo, HTTP).

---

## 🧪 Más ejemplos útiles

### Capturar tráfico ICMP (ping)
```bash
sudo tcpdump icmp -i eth0
```

### Ver cabeceras Ethernet (detalles de capa 2)
```bash
sudo tcpdump -e -i eth0
```

### Mostrar solo cabecera sin datos
```bash
sudo tcpdump -q -i eth0
```

---

## 📁 Guardar y revisar después

```bash
sudo tcpdump -i eth0 -w captura.pcap port 80
```
Luego:
```bash
tcpdump -r captura.pcap
```

---

## ✅ Consejos importantes

- Si no especificas `-i`, usará la primera interfaz disponible.
- Usa `-nn` para evitar retrasos por DNS o resolución de servicios.
- En entornos con mucho tráfico, limita con filtros o usa `-c`.
- Para análisis visual más completo, abre los `.pcap` con **Wireshark**.
