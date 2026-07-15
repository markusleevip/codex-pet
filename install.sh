#!/bin/sh
set -eu

ROOT_DIR=$(CDPATH= cd -- "$(dirname -- "$0")" && pwd)
CODEX_HOME_DIR=${CODEX_HOME:-"$HOME/.codex"}
PACKAGES_DIR="$ROOT_DIR/pets"

if [ ! -d "$PACKAGES_DIR" ]; then
  echo "error: pets directory is missing from $ROOT_DIR" >&2
  exit 1
fi

installed=0
for PACKAGE_DIR in "$PACKAGES_DIR"/*; do
  [ -d "$PACKAGE_DIR" ] || continue
  [ -f "$PACKAGE_DIR/pet.json" ] || continue
  [ -f "$PACKAGE_DIR/spritesheet.webp" ] || continue

  PET_ID=$(basename -- "$PACKAGE_DIR")
  TARGET_DIR="$CODEX_HOME_DIR/pets/$PET_ID"
  mkdir -p "$TARGET_DIR"
  cp "$PACKAGE_DIR/pet.json" "$TARGET_DIR/pet.json"
  cp "$PACKAGE_DIR/spritesheet.webp" "$TARGET_DIR/spritesheet.webp"
  echo "Installed $PET_ID to $TARGET_DIR"
  installed=$((installed + 1))
done

if [ "$installed" -eq 0 ]; then
  echo "error: no installable pet packages found under $PACKAGES_DIR" >&2
  exit 1
fi
