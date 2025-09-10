#!/bin/bash

# Script para servir a Plataforma de Assinatura Digital
# Para usar: ./serve.sh

echo "🚀 Iniciando a Plataforma de Assinatura Digital..."
echo "📄 Abrindo no navegador: http://localhost:8000"
echo "🛑 Para parar o servidor, pressione Ctrl+C"
echo ""

# Tenta usar Python 3 primeiro
if command -v python3 &> /dev/null; then
    echo "✅ Usando Python 3"
    python3 -m http.server 8000
elif command -v python &> /dev/null; then
    echo "✅ Usando Python"
    python -m http.server 8000
else
    echo "❌ Python não encontrado. Instale Python ou use 'npx serve .' se tiver Node.js"
    exit 1
fi