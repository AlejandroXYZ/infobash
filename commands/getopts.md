## getopts

El comando `getopts` en Bash se utiliza para procesar opciones (flags) y argumentos pasados a un script. Es muy útil para crear scripts que acepten opciones de línea de comandos de forma limpia y estandarizada.

---

## 📌 Sintaxis básica

```bash
while getopts "opciones" variable; do
  case $variable in
    opción1)
      # código para opción1
      ;;
    opción2)
      # código para opción2
      ;;
    \?)
      echo "Uso incorrecto"
      exit 1
      ;;
  esac
done
```

- `"opciones"`: una cadena con las letras de las opciones permitidas.
  - Si una opción requiere un argumento, se le pone `:` después de la letra.
- `variable`: almacena la opción actual durante cada iteración del bucle.

---

## ✅ Ejemplo básico sin parámetros

**Script:** `ejemplo.sh`

```bash
#!/bin/bash

while getopts "hv" opt; do
  case $opt in
    h)
      echo "Ayuda: ./script.sh [-h] [-v]"
      ;;
    v)
      echo "Versión 1.0"
      ;;
    \?)
      echo "Opción inválida: -$OPTARG" >&2
      exit 1
      ;;
  esac
done
```

**Ejecución:**

```bash
$ ./ejemplo.sh -h
Ayuda: ./script.sh [-h] [-v]

$ ./ejemplo.sh -v
Versión 1.0

$ ./ejemplo.sh -x
Opción inválida: -x
```

---

## ✅ Ejemplo con opciones que requieren argumentos

**Script:** `backup.sh`

```bash
#!/bin/bash

while getopts "s:d:" opt; do
  case $opt in
    s)
      SOURCE="$OPTARG"
      ;;
    d)
      DESTINATION="$OPTARG"
      ;;
    \?)
      echo "Uso: $0 -s <origen> -d <destino>" >&2
      exit 1
      ;;
  esac
done

echo "Copiando de $SOURCE a $DESTINATION..."
# cp -r "$SOURCE" "$DESTINATION"
```

**Ejecución:**

```bash
$ ./backup.sh -s /home/user/docs -d /backup/
Copiando de /home/user/docs a /backup/
```

Si omites un argumento:

```bash
$ ./backup.sh -s
./backup.sh: option requires an argument -- s
Uso: ./backup.sh -s <origen> -d <destino>
```

---

## ✅ Opciones combinadas

`getopts` permite combinar varias opciones en una sola:

```bash
$ ./ejemplo.sh -hv
```

Este ejemplo ejecutaría tanto `-h` como `-v`.

---

## 🛠️ Notas importantes

- `OPTARG`: variable especial que contiene el valor del argumento actual.
- `OPTIND`: índice del siguiente argumento no procesado. Útil si quieres procesar más argumentos después de las opciones.
- Las opciones deben ir al inicio. Una vez que `getopts` encuentra un argumento que no empieza con `-`, deja de procesar opciones.

---

## ✅ Ejemplo avanzado: mezcla de opciones con y sin argumentos

```bash
#!/bin/bash

VERBOSE=false

while getopts "f:o:v" opt; do
  case $opt in
    f)
      FILE="$OPTARG"
      ;;
    o)
      OUTPUT="$OPTARG"
      ;;
    v)
      VERBOSE=true
      ;;
    \?)
      echo "Error en opciones." >&2
      exit 1
      ;;
  esac
done

if $VERBOSE; then
  echo "Procesando archivo $FILE..."
fi

echo "Guardando salida en $OUTPUT"
```

**Ejecución:**

```bash
$ ./procesar.sh -f input.txt -o output.txt -v
Procesando archivo input.txt...
Guardando salida en output.txt
```

---
