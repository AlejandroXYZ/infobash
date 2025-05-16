## 📄 Archivo `README.md` – Versión Final Recomendada

```markdown
# 🐚 Bash Cheat Sheet Interactivo – `infobash`

> ¡Una guía rápida y amigable para aprender comandos de Linux directamente desde la terminal!

![Banner](.banner.ascii)

Este es un pequeño proyecto hecho en **Bash Scripting** que te permite consultar fácilmente información sobre los comandos más usados en Linux, sin salir de la terminal. Ideal tanto para principiantes como para usuarios intermedios que quieren tener una referencia rápida.


## 🧩 Características Principales

- ✅ Menú interactivo con navegación intuitiva.
- 🔍 Búsqueda rápida de comandos (ej: `infobash awk`).
- 📄 Visualización bonita del contenido usando `glow`.
- 🛠️ Fácil instalación y desinstalación.
- 🗂️ Estructura modular: agrega nuevos comandos fácilmente creando archivos `.md`.

---
---
## ⚙️ Instalación

1. Clona este repositorio:
   ```bash
   git clone https://github.com/AlejandroXYZ/bash-cheat-sheet.git
   cd bash-cheat-sheet
   ```

2. Ejecuta el instalador como **superusuario**:
   ```bash
   sudo ./install.sh
   ```

> ✅ El instalador detectará si estás en un sistema basado en **Arch** o **Debian**, e instalará las dependencias necesarias.
---

## 💻 Uso

### Modo Interactivo
```bash
infobash
```
Te mostrará un menú donde puedes buscar comandos y navegar por ellos.


### Uso Directo
```bash
infobash ls
infobash grep
infobash chmod
```

Muestra la información del comando especificado.

### Ver Ayuda
```bash
infobash -h
infobash --help
```

### Desinstalar
```bash
infobash --desinstall
```

El programa te preguntará si deseas eliminarlo del sistema.

---

## 📁 Estructura del Proyecto

```
bash-cheat-sheet/
├── commands/             # Aquí van los .md con info de cada comando
│   ├── ls.md
│   ├── cp.md
│   └── ...
├── .banner.ascii         # Banner ASCII mostrado al inicio
├── help.md               # Panel de ayuda (este archivo)
├── infobash.sh           # Script principal
└── install.sh            # Script de instalación
```

---


## 🧑‍💻 ¿Cómo Contribuir?

¡Se aceptan contribuciones! Puedes:

- Añadir más comandos a la carpeta `commands/`.
- Mejorar la traducción o estilo de los `.md`.
- Optimizar el código del script principal.
- Sugerir nuevas funcionalidades.

Solo haz un fork, crea una rama nueva y abre un Pull Request.

---
---

## 👤 Autor

**Alejandro Moncada**  
GitHub: [@AlejandroXYZ](https://github.com/AlejandroXYZ)  
Correo: alejandromdekuedit@gmail.com

---

## 🙌 Gracias por usar Infobash

Espero que te sea útil. ¡Sigue aprendiendo y explorando el mundo de Linux!
```

---
