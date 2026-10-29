# Publicar o Desafio Total de graça no GitHub Pages

A pasta **`docs/`** é o site pronto para publicar (sem servidor, sem login: o jogador só escolhe um nome).
O GitHub Pages **não roda Python**, por isso a versão com login (`backend/`) é só para uso local.

## Passo a passo
1. Crie uma conta em https://github.com e clique em **New repository**. Dê um nome (ex.: `desafio-total`), deixe **Public** e crie.
2. Na página do repositório vazio, clique em **uploading an existing file** e arraste **todo o conteúdo desta pasta** (incluindo `docs/`, e a pasta `.nojekyll` dentro dela). Clique em **Commit changes**.
   - Se preferir pelo terminal do VS Code:
     ```
     git init
     git add .
     git commit -m "Desafio Total"
     git branch -M main
     git remote add origin https://github.com/SEU-USUARIO/desafio-total.git
     git push -u origin main
     ```
3. No repositório: **Settings → Pages**. Em *Build and deployment*, escolha **Deploy from a branch**, branch **main**, pasta **/docs**, e clique **Save**.
4. Espere 1–2 minutos. O endereço aparece na mesma tela: `https://SEU-USUARIO.github.io/desafio-total/`.

## Antes de divulgar
- Em `docs/js/app.js`, na página **Contato**, troque `contato@seudominio.com.br` pelo seu e-mail real.
- Revise as páginas Privacidade e Termos (são modelos).

## Google AdSense
1. Com o site no ar, peça a análise em https://adsense.google.com (precisa ser maior de 18 anos). O AdSense costuma exigir domínio próprio (ex.: registro.br); um endereço `github.io` pode ser recusado.
2. Depois de aprovado, abra `docs/js/app.js` e preencha no topo: `ADS={client:"ca-pub-SEUCODIGO", slots:{home:"NUMERO", cat:"NUMERO", result:"NUMERO"}}`.
3. Coloque no `docs/ads.txt` a linha que o AdSense fornece.
4. Os anúncios só carregam depois que o visitante clica **Aceitar** no aviso de cookies.
