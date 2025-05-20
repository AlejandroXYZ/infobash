## Tshark

`tshark` es la versión en línea de comandos de **Wireshark**. Al igual que `tcpdump`, permite capturar y analizar paquetes de red, pero ofrece:

- Decodificación más detallada
- Filtros basados en protocolos y campos específicos (como en Wireshark)
- Soporte para múltiples formatos de salida (JSON, CSV, etc.)
- Mayor flexibilidad en análisis

> Requiere permisos de administrador (`sudo`) para capturar tráfico en tiempo real.


## 🔍 Comandos Básicos de `tshark`

### 1. **Listar interfaces disponibles**
```bash
tshark -D
```
Ejemplo salida:
```
1. eth0
2. lo
3. any
4. bluetooth0
```

---

### 2. **Capturar paquetes en una interfaz**
```bash
sudo tshark -i eth0
```
> Presiona `Ctrl + C` para detener la captura.

---

### 3. **Mostrar solo ciertos campos (útil para logs o scripts)**
```bash
sudo tshark -i eth0 -T fields -e frame.time -e ip.src -e ip.dst -e tcp.port
```
Este comando muestra: hora, IP origen, IP destino y puerto TCP.

---

### 4. **Limitar el número de paquetes**
```bash
sudo tshark -i eth0 -c 10
```
> Captura solo 10 paquetes y se detiene automáticamente.

---

### 5. **Guardar la captura en un archivo `.pcap`**
```bash
sudo tshark -i eth0 -w captura.pcap
```
Puedes abrir este archivo después con Wireshark o `tshark`.

---

### 6. **Leer una captura guardada**
```bash
tshark -r captura.pcap
```

---

## 🔎 Filtros Avanzados

### 7. **Filtrar por puerto (ej: HTTP en puerto 80)**
```bash
sudo tshark -i eth0 -f "port 80"
```

### 8. **Filtrar por dirección IP**
```bash
sudo tshark -i eth0 -f "host 192.168.1.10"
```

### 9. **Usar filtros tipo Wireshark (más potente)**
```bash
sudo tshark -i eth0 -Y "tcp && ip.src == 192.168.1.10"
```
> `-Y`: filtro de visualización (display filter), como en la GUI de Wireshark.

---

## 📁 Exportar datos

### 10. **Exportar a formato CSV**
```bash
tshark -r captura.pcap -T fields -e frame.number -e ip.src -e ip.dst -e tcp.port > salida.csv
```

### 11. **Exportar a JSON (útil para procesamiento automático)**
```bash
tshark -r captura.pcap -T json > salida.json
```

### 12. **Ver solo los datos del payload (en hexadecimal o ASCII)**
```bash
tshark -r captura.pcap -x
```

---

## 💡 Ejemplos Prácticos

### Ver solo tráfico SSH
```bash
sudo tshark -i eth0 -Y "ssh"
```

### Ver solo tráfico DNS
```bash
sudo tshark -i eth0 -Y "dns"
```

### Ver solo paquetes ICMP (ping)
```bash
sudo tshark -i eth0 -Y "icmp"
```

### Filtrar tráfico HTTP con URL específica
```bash
sudo tshark -i eth0 -Y 'http.host contains "google.com"'
```

---

## 🛠️ Uso en Scripts

### Mostrar solo IPs y puertos de conexión HTTP
```bash
sudo tshark -i eth0 -Y "http" -T fields -e ip.src -e tcp.srcport -e ip.dst -e tcp.dstport
```

### Contar cuántos paquetes hay en un archivo `.pcap`
```bash
tshark -r captura.pcap | wc -l
```

---

## ✅ Resumen de Opciones Útiles

| Opción        | Descripción                                  |
|---------------|----------------------------------------------|
| `-i eth0`     | Interfaz de red                             |
| `-r archivo.pcap` | Leer desde archivo                         |
| `-w archivo.pcap` | Guardar captura                            |
| `-c N`        | Capturar solo N paquetes                    |
| `-Y "filtro"` | Filtro avanzado estilo Wireshark            |
| `-f "filtro"` | Filtro básico estilo `tcpdump`              |
| `-T fields`   | Muestra solo campos seleccionados           |
| `-e campo`    | Especifica qué campo mostrar                |
| `-x`          | Muestra contenido del paquete en hex        |

---
