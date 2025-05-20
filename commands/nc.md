## Nc ( Netcat )

Es una herramienta muy versátil en Linux que permite leer y escribir datos a través de conexiones de red, tanto TCP como UDP. Es muy útil para pruebas de red, transferencia de archivos simples, escaneo de puertos, etc.

---

### 📡 1. **Servidor simple de escucha (listener)**

```bash
nc -lvp 1234
```

- `-l`: Modo escucha (listen).
- `-v`: Verbose (muestra información detallada).
- `-p 1234`: Puerto en el que escuchar.

Este comando pone a Netcat a la espera de conexiones entrantes en el puerto 1234. Puedes conectarte desde otro equipo con:

```bash
nc IP_DEL_SERVIDOR 1234
```

Una vez conectados, puedes escribir texto en uno y aparecerá en el otro.

---

### 💬 2. **Enviar mensajes entre dos equipos**

**En el servidor:**
```bash
nc -lvp 5000
```

**En el cliente:**
```bash
nc 192.168.1.100 5000
```

(Reemplaza `192.168.1.100` por la IP del servidor.)

Ahora ambos pueden intercambiar mensajes de texto en tiempo real.

---

### 📁 3. **Transferir archivos de un equipo a otro**

**En el servidor (recibe el archivo):**
```bash
nc -lvp 4000 > recibido.txt
```

**En el cliente (envía el archivo):**
```bash
nc 192.168.1.100 4000 < archivo.txt
```

Esto enviará el contenido de `archivo.txt` al servidor, donde se guardará como `recibido.txt`.

---

### 🧪 4. **Prueba rápida de conectividad (cliente TCP)**

```bash
nc -zv google.com 80
```

- `-z`: Escanea solo los puertos, sin enviar datos.
- Comprueba si el puerto 80 (HTTP) de `google.com` está abierto.

Útil para ver si un servicio está activo.

---

### 🔍 5. **Escaneo de puertos (port scanning)**

```bash
nc -zv 192.168.1.1 20-100
```

Comprueba qué puertos entre el 20 y el 100 están abiertos en la IP especificada.

---

### 📶 6. **Usar UDP en lugar de TCP**

Por defecto, Netcat usa TCP. Para usar UDP:

```bash
nc -uvz 192.168.1.1 53
```

Esto es útil para probar servicios UDP como DNS (puerto 53).

---

### 🔄 7. **Conectar a un servicio web manualmente**

Puedes usar `nc` para interactuar manualmente con servidores web:

```bash
nc www.ejemplo.com 80
```

Después escribes:

```
GET / HTTP/1.1
Host: www.ejemplo.com
```

Presiona Enter dos veces y obtendrás la respuesta HTTP del servidor.

---

### 🐚 8. **Ejecutar comandos remotamente (peligroso y no recomendado en producción)**

**Servidor (escucha y ejecuta comandos):**
```bash
nc -lvp 1234 | bash
```

**Cliente (envía comandos):**
```bash
nc 192.168.1.100 1234
```

Luego escribes comandos como `ls`, `whoami`, etc., y se ejecutan en el servidor.
---
