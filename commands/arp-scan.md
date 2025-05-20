## arp-scan

`arp-scan` es una utilidad de línea de comandos que envía paquetes **ARP Request** a direcciones MAC o IP específicas (o a toda la red) y muestra las respuestas que recibe. Es ideal para descubrir dispositivos en tu red local (LAN), incluso si tienen un firewall que bloquea ICMP (ping).


## ✅ Características principales

- Descubre dispositivos activos en la red local.
- Muestra la dirección MAC y el **fabricante** asociado.
- Permite enviar paquetes a direcciones MAC específicas.
- Soporta interfaces en modo promiscuo para capturar tráfico.
- Puede usar listas de direcciones MAC personalizadas.
- Funciona en sistemas Linux y BSD.



## 🛠️ Uso básico de `arp-scan`

### 1. Escanear toda la subred actual

```bash
sudo arp-scan --interface=eth0 --localnet
```

- `--interface=eth0`: Indica la interfaz de red a usar (puede ser `wlan0`, `enp0s3`, etc.)
- `--localnet`: Escanea todas las IPs en la subred conectada a esa interfaz.

**Ejemplo de salida:**

```
Interface: eth0, datalink type: EN10MB (Ethernet)
Starting arp-scan with 256 probes (1 per host)
192.168.1.1     00:11:22:33:44:55       TP-LINK TECHNOLOGIES CO.,LTD.
192.168.1.5     00:0d:3c:4d:5e:6f       Apple, Inc
192.168.1.10    00:1b:44:11:3a:b7       ASUSTek COMPUTER INC.
...
```

---



## 🧪 Ejemplos prácticos avanzados

### 2. Escanear solo una IP específica

```bash
sudo arp-scan --interface=wlan0 --destination=192.168.1.10
```

Útil para verificar si un dispositivo específico está activo.

---



### 3. Mostrar solo los dispositivos conocidos (con nombre de fabricante)

```bash
sudo arp-scan --interface=eth0 --localnet --quiet --interface=eth0
```

El `--quiet` reduce la salida a solo lo relevante.

---




### 4. Usar una lista personalizada de direcciones MAC

Puedes crear un archivo con direcciones MAC y hacer un escaneo dirigido:

```bash
sudo arp-scan --interface=eth0 --file=maclist.txt --random
```

Donde `maclist.txt` contiene algo como:

```
00:11:22:33:44:55
00:0d:3c:4d:5e:6f
00:1b:44:11:3a:b7
```

- `--random`: Envía las solicitudes en orden aleatorio.

---



### 5. Escaneo pasivo (solo escuchar sin enviar)


```bash
sudo arp-scan --interface=eth0 --passive
```

Este modo no envía paquetes, solo escucha las solicitudes ARP que otros dispositivos envían, útil para monitoreo silencioso.

---




### 6. Mostrar más detalles (incluyendo tiempo de respuesta)

```bash
sudo arp-scan --interface=eth0 --localnet --verbose
```

Muestra cuánto tardó en responder cada dispositivo.

---



## 🔍 Detección de dispositivos ocultos o con firewall

Un dispositivo puede estar activo pero bloqueando pings ICMP. Sin embargo, seguirá respondiendo a solicitudes ARP si está en la misma LAN, por lo que `arp-scan` puede detectarlo igualmente.

---




## 🛡️ Detección de uso malicioso

Si alguien usa `arp-scan` de forma maliciosa, podría estar mapeando tu red para lanzar ataques posteriores (como **ARP spoofing** o **MITM**). Algunas formas de detectarlo son:

- Monitorear logs de seguridad.
- Usar IDS como Snort o Zeek para detectar actividad anormal de ARP.
- Notar múltiples solicitudes ARP en corto tiempo desde una misma MAC.

---

## 📌 Resumen rápido de comandos útiles

| Acción | Comando |
|--------|---------|
| Escanear toda la red | `sudo arp-scan --interface=eth0 --localnet` |
| Escanear una IP | `sudo arp-scan --interface=eth0 --destination=192.168.1.10` |
| Escanear desde lista | `sudo arp-scan --interface=eth0 --file=maclist.txt` |
| Modo pasivo | `sudo arp-scan --interface=eth0 --passive` |
| Salida limpia | `sudo arp-scan --interface=eth0 --localnet --quiet` |

---
