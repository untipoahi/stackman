#!/bin/bash

STACKS="$HOME/.stackman/stacks.txt"
SCAN_SCRIPT="$HOME/.stackman/scan.sh"
ACTION=$1
TARGET=$2

case "$ACTION" in
  scan)
    [ -x "$SCAN_SCRIPT" ] || { echo "❌ Falta o no es ejecutable: $SCAN_SCRIPT"; exit 1; }
    "$SCAN_SCRIPT"
    exit 0
    ;;
  list)
    [ -f "$STACKS" ] || { echo "❌ No existe $STACKS"; exit 1; }
    echo "📦 Stacks registrados:"
    awk -F= '{ printf "• \033[1m%s\033[0m → %s\n", $1, $2 }' "$STACKS"
    exit 0
    ;;
  ps)
    while IFS='=' read -r name path; do
      echo "▶ $name"
      (cd "$path" && docker compose ps)
      echo
    done < "$STACKS"
    exit 0
    ;;
  up|down|logs|restart)
    [ -z "$TARGET" ] && { echo "❌ Falta el nombre del stack"; exit 1; }
    DIR=$(grep "^$TARGET=" "$STACKS" | cut -d'=' -f2)
    [ -z "$DIR" ] && { echo "❌ Stack '$TARGET' no encontrado."; exit 1; }
    cd "$DIR" || exit
    case "$ACTION" in
      up) docker compose up -d ;;
      down) docker compose down ;;
      logs) docker compose logs -f ;;
      restart) docker compose restart ;;
    esac
    ;;
  *)
    echo "📦 Stacks disponibles:"
    echo
    awk -F= '{ printf "• \033[1m%s\033[0m → %s\n", $1, $2 }' "$STACKS"
    echo
    echo "⚡ Uso: stackman <acción> [stack]"
    echo
    echo "Acciones disponibles:"
    echo "  scan      → Escanea ~/workspace y actualiza stacks.txt"
    echo "  list      → Lista todos los stacks disponibles"
    echo "  ps        → Muestra el estado de todos los stacks"
    echo "  up        → Inicia un stack (requiere nombre)"
    echo "  down      → Detiene un stack"
    echo "  logs      → Logs en vivo"
    echo "  restart   → Reinicia un stack"
    exit 1
    ;;
esac
