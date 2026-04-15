#!/bin/bash

set -e

echo "=========================================="
echo "  COMPILANDO GODOT"
echo "=========================================="

# Verificar dependencias

command -v clang++ >/dev/null || { echo "Falta clang"; exit 1; }
command -v scons >/dev/null || { echo "Falta scons"; exit 1; }

echo "Usando compilador: $(clang++ --version | head -1)"

# Detectar núcleos

CORES=$(nproc)
echo "Núcleos detectados: $CORES"

echo -e "\nCompilando editor..."
scons platform=linuxbsd target=editor arch=x86_64 use_llvm=yes -j$CORES

echo -e "\n✔ Compilación completa"
