#!/bin/bash

set -e

echo "=========================================="
echo "  COMPILANDO GODOT"
echo "=========================================="

# Verificar dependencias

command -v clang++ >/dev/null || { echo "Falta clang"; exit 1; }
command -v scons >/dev/null || { echo "Falta scons"; exit 1; }

echo "Usando compilador: $(clang++ --version | head -1)"

# Configuración

export SCONS_FLAGS="platform=linuxbsd arch=x86_64 use_llvm=yes use_lto=yes production=yes CC=clang CXX=clang++ -j$(nproc)"

echo -e "\nCompilando editor..."
scons target=editor $SCONS_FLAGS

echo -e "\n✔ Compilación completa"
