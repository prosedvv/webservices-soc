#!/bin/bash
# Script para iniciar o webservice em produção

# Configurar variáveis de ambiente para produção
export FLASK_ENV=production
export FLASK_DEBUG=False

# Ativar ambiente virtual
source venv/bin/activate

# Instalar dependências (se necessário)
pip install -r requirements.txt

# Iniciar com Gunicorn (servidor WSGI para produção)
echo "Iniciando webservice em produção..."
gunicorn --bind 0.0.0.0:5000 --workers 4 --timeout 120 wsgi:app

