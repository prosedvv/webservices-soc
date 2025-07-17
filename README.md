# Meu Web Service

API RESTful profissional desenvolvida com Flask para gerenciamento de usuários e produtos.

## Características

- ✅ API RESTful completa
- ✅ Validação robusta de dados
- ✅ Tratamento adequado de erros
- ✅ Paginação e filtros
- ✅ CORS habilitado
- ✅ Logging estruturado
- ✅ Documentação automática
- ✅ Configuração por ambiente
- ✅ Pronto para produção

## Instalação

### Pré-requisitos

- Python 3.8+
- pip
- virtualenv (recomendado)

### Setup Local

```bash
# Clonar o repositório
git clone <url-do-repositorio>
cd meu_webservice

# Criar ambiente virtual
python3 -m venv venv
source venv/bin/activate  # Linux/Mac
# ou
venv\Scripts\activate     # Windows

# Instalar dependências
pip install -r requirements.txt

# Configurar variáveis de ambiente
cp .env.example .env
# Editar .env conforme necessário

# Executar em desenvolvimento
python src/main.py
```

## Uso

### Endpoints Disponíveis

#### Saúde da API
- `GET /api/health` - Verifica se a API está funcionando

#### Documentação
- `GET /api/docs` - Documentação completa da API

#### Usuários
- `GET /api/users` - Lista todos os usuários
- `POST /api/users` - Cria um novo usuário
- `GET /api/users/{id}` - Busca usuário específico
- `PUT /api/users/{id}` - Atualiza usuário
- `DELETE /api/users/{id}` - Remove usuário

#### Produtos
- `GET /api/produtos` - Lista produtos (com paginação)
- `POST /api/produtos` - Cria um novo produto
- `GET /api/produtos/{id}` - Busca produto específico
- `PUT /api/produtos/{id}` - Atualiza produto
- `DELETE /api/produtos/{id}` - Remove produto
- `GET /api/produtos/categorias` - Lista categorias

### Exemplos de Uso

#### Criar Usuário
```bash
curl -X POST http://localhost:5000/api/users \
  -H "Content-Type: application/json" \
  -d '{"username": "joao", "email": "joao@exemplo.com"}'
```

#### Criar Produto
```bash
curl -X POST http://localhost:5000/api/produtos \
  -H "Content-Type: application/json" \
  -d '{
    "nome": "Smartphone",
    "preco": 899.99,
    "categoria": "Eletrônicos",
    "descricao": "Smartphone com 128GB"
  }'
```

#### Listar Produtos com Filtro
```bash
curl "http://localhost:5000/api/produtos?categoria=Eletrônicos&page=1&per_page=5"
```

## Configuração

### Variáveis de Ambiente

| Variável | Descrição | Padrão |
|----------|-----------|---------|
| `FLASK_ENV` | Ambiente (development/production) | development |
| `SECRET_KEY` | Chave secreta para sessões | (gerada) |
| `DATABASE_URL` | URL do banco de dados | SQLite local |
| `CORS_ORIGINS` | Origens permitidas para CORS | * |
| `LOG_LEVEL` | Nível de logging | INFO |
| `HOST` | Host do servidor | 0.0.0.0 |
| `PORT` | Porta do servidor | 5000 |

### Banco de Dados

Por padrão, usa SQLite para desenvolvimento. Para produção, configure `DATABASE_URL`:

```bash
# PostgreSQL
DATABASE_URL=postgresql://usuario:senha@localhost/nome_do_banco

# MySQL
DATABASE_URL=mysql://usuario:senha@localhost/nome_do_banco
```

## Deploy

### Desenvolvimento
```bash
python src/main.py
```

### Produção
```bash
# Usando o script fornecido
./start_production.sh

# Ou manualmente com Gunicorn
gunicorn --bind 0.0.0.0:5000 --workers 4 wsgi:app
```

### Docker (Opcional)
```dockerfile
FROM python:3.11-slim

WORKDIR /app
COPY requirements.txt .
RUN pip install -r requirements.txt

COPY . .
EXPOSE 5000

CMD ["gunicorn", "--bind", "0.0.0.0:5000", "wsgi:app"]
```

## Testes

```bash
# Executar testes básicos
python teste_api.py

# Teste manual dos endpoints
curl http://localhost:5000/api/health
```

## Estrutura do Projeto

```
meu_webservice/
├── src/
│   ├── models/          # Modelos de dados
│   │   ├── user.py
│   │   └── produto.py
│   ├── routes/          # Rotas da API
│   │   ├── user.py
│   │   └── produtos.py
│   ├── static/          # Arquivos estáticos
│   ├── database/        # Banco de dados
│   └── main.py          # Aplicação principal
├── config.py            # Configurações
├── wsgi.py             # Arquivo WSGI
├── requirements.txt     # Dependências
├── .env.example        # Exemplo de variáveis
└── start_production.sh # Script de produção
```

## Contribuição

1. Fork o projeto
2. Crie uma branch para sua feature (`git checkout -b feature/AmazingFeature`)
3. Commit suas mudanças (`git commit -m 'Add some AmazingFeature'`)
4. Push para a branch (`git push origin feature/AmazingFeature`)
5. Abra um Pull Request

## Licença

Este projeto está sob a licença MIT. Veja o arquivo `LICENSE` para mais detalhes.

## Suporte

Para dúvidas ou problemas:
1. Verifique a documentação
2. Consulte os logs da aplicação
3. Abra uma issue no repositório

## Roadmap

- [ ] Autenticação JWT
- [ ] Rate limiting
- [ ] Cache com Redis
- [ ] Testes automatizados
- [ ] CI/CD pipeline
- [ ] Documentação OpenAPI/Swagger

