#!/bin/bash

mkdir -p "$HOME/.stackman"
STACK_FILE="$HOME/.stackman/stacks.txt"

find "$HOME/workspace" -maxdepth 2 -type f -name 'docker-compose.yml' | while read file; do
  dir=$(dirname "$file")
  key=$(basename "$dir")
  echo "$key=$dir"
done | sort > "$STACK_FILE"

echo "✅ stacks.txt actualizado en: $STACK_FILE"

