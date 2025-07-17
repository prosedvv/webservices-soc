"""
Arquivo WSGI para deploy em produção
Usado por servidores como Gunicorn, uWSGI, etc.
"""
import os
import sys

# Adicionar o diretório do projeto ao path
sys.path.insert(0, os.path.dirname(__file__))

from src.main import app

if __name__ == "__main__":
    app.run()

