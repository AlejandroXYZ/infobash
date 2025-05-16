## 🙌 Gracias por usar Infobash

Creado por **Alejandro Josue Moncada Delgado**  
GitHub: [@AlejandroXYZ](https://github.com/AlejandroXYZ)  
Versión: 1.0.0
```

Bienvenido a **Infobash**, una herramienta interactiva y rápida para aprender y consultar comandos básicos de Linux desde la terminal.

---

## 🧭 Índice

- [¿Qué es Infobash?](#que-es-infobash)
- [🔍 Modo Interactivo](#modo-interactivo)
- [⌨️ Uso desde Consola](#uso-desde-consola)
- [🛠️ Opciones Adicionales](#opciones-adicionales)
- [🗑️ Desinstalación](#desinstalacion)
- [📄 Archivos del Proyecto](#archivos-del-proyecto)

---

## ¿Qué es Infobash?

Es una guía rápida tipo *cheat sheet* con información útil sobre comandos comunes de Linux, ideal para usuarios principiantes o intermedios que quieren aprender sin salir de la terminal.

---

## 🔍 Modo Interactivo

Ejecuta solo:
```bash
infobash
```

Te mostrará un menú donde podrás:
- Buscar información sobre comandos.
- Ver detalles formateados con `glow`.

---

## ⌨️ Uso desde Consola

También puedes usarlo directamente desde la línea de comandos:
```bash
infobash ls
infobash grep
infobash chmod
```

Esto muestra la información relacionada con ese comando específico.

---

## 🛠️ Opciones Adicionales

| Comando             | Descripción                           |
|---------------------|----------------------------------------|
| `infobash -h`       | Muestra este panel de ayuda.           |
| `infobash --help`   | Igual que `-h`.                        |
| `infobash --desinstall` | Inicia el proceso de desinstalación. |

---

## 🗑️ Desinstalación

Para desinstalar:
```bash
infobash --desinstall
```

El script te preguntará si deseas eliminar los archivos del sistema.

---

## 📁 Archivos del Proyecto

- **Directorio de instalación:** `/opt/bash_cheat_sheet`
- **Comandos disponibles:** Carpeta `commands/` (ej: `ls.md`, `grep.md`)
- **Script principal:** `infobash.sh`
- **Banner ASCII:** `.banner.ascii`
- **Ayuda:** `help.md`

## ✅ Cómo usarlo

Una vez creado este archivo, asegúrate de tenerlo en tu estructura de carpetas:

```
bash-cheat-sheet/
├── commands/
│   ├── ls.md
│   ├── cp.md
│   └── ...
├── .banner.ascii
├── help.md        ← Aquí va este archivo
├── infobash.sh
└── install.sh
```

Y en tu script principal (`infobash.sh`), ya tienes esta línea que lo usa:

```bash
elif [[ $1 == "-h" || $1 == "--help" ]]; then
    glow -p help.md
```

---
```
