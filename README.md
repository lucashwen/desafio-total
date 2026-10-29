> **Para publicar online (grátis, GitHub Pages) veja `PUBLICAR_NO_GITHUB.md`.** A pasta `docs/` é a versão estática; o restante é a versão local com login.

# Desafio Total — projeto organizado

O projeto agora usa **Python + Flask + SQLite** para criar contas e controlar o login. Não abra `index.html` com duplo clique: o servidor Python precisa estar ligado para que o login funcione.

## Como iniciar no Windows (jeito mais fácil)

1. Extraia o arquivo ZIP inteiro para uma pasta.
2. Instale Python 3.10 ou superior, se ainda não tiver.
3. Dentro da pasta extraída, dê dois cliques em **`INICIAR_DESAFIO_TOTAL.bat`**. Ele instala/verifica os componentes e abre o site no navegador.
4. Na página inicial, o formulário **Criar conta** aparece à esquerda e o formulário **Entrar** à direita. Preencha o cadastro; depois use o formulário Entrar ao lado.
5. Depois que a conta for criada, entre com o mesmo e-mail e senha.

**Importante:** não abra `index.html` com duplo clique. O cadastro precisa do servidor Python; use sempre `INICIAR_DESAFIO_TOTAL.bat`. A janela preta do servidor deve ficar aberta enquanto joga.

### Se preferir iniciar manualmente

Abra o CMD nesta pasta e execute:

```bash
py -m pip install -r requirements.txt
py backend\app.py
```

Depois abra `http://127.0.0.1:5000` no navegador.

## Como iniciar no Linux/macOS

```bash
python3 -m venv .venv
source .venv/bin/activate
python -m pip install -r requirements.txt
python backend/app.py
```

Depois abra `http://127.0.0.1:5000`.

## Onde está cada coisa?

```text
Desafio Total/
├── INICIAR_DESAFIO_TOTAL.bat # Inicia o servidor no Windows
├── backend/
│   └── app.py              # Cadastro, login, sessão, validação e banco de contas
├── templates/
│   └── auth.html           # Telas de entrar e criar conta
├── data/
│   └── desafio_total.db    # Criado automaticamente; guarda contas cadastradas
├── css/
│   └── style.css           # Estilo principal do jogo
├── js/
│   ├── app.js              # Navegação, quizzes, perfil, amigos e campeonatos
│   ├── perguntas.js        # Perguntas gerais por categoria
│   ├── biblia-faceis.js    # Perguntas bíblicas fáceis
│   ├── biblia-medias.js    # Perguntas bíblicas médias
│   └── biblia-dificeis.js  # Perguntas bíblicas difíceis
├── index.html              # Página principal do jogo (servida após login)
└── requirements.txt        # Dependências Python
```

### Onde fica o login?
- `backend/app.py`: procure `def login()` para entrar e `def register()` para criar conta.
- `templates/auth.html`: campos de e-mail e senha que aparecem na tela.
- O estilo da tela de login está dentro do próprio `templates/auth.html`.

### Onde ficam as salas/campeonatos?
- `js/app.js`: procure pelo comentário `Salas de campeonato`.
- Nesse bloco ficam criação de sala, entrada por código, perguntas, pontuação e placar.
- O protótipo atual ainda sincroniza as salas por `localStorage` entre abas da mesma origem/navegador; partidas entre computadores diferentes exigem um serviço de tempo real no servidor.

### Segurança e e-mail
- O login só aceita um e-mail que já esteja cadastrado no banco **e a senha correspondente**.
- As senhas não são guardadas em texto puro: o servidor armazena um hash de senha.
- O cadastro verifica o formato do e-mail e impede duplicatas. **Ainda não envia mensagem de confirmação**; para provar que o e-mail realmente existe e pertence ao usuário, configure um provedor de e-mail e um link/código de verificação.
- Se `SECRET_KEY` não estiver definida, o servidor gera uma chave aleatória e a guarda em `data/secret.key` (não compartilhe). Antes de publicar na internet, defina uma `SECRET_KEY` forte por variável de ambiente, use HTTPS e um servidor de produção. O servidor incluído é para desenvolvimento local.

## Perguntas
Não apague os arquivos em `js/`. Para acrescentar perguntas extras, abra `js/perguntas.js` e siga o formato usado ali.
