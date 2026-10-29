@echo off
chcp 65001 >nul
cd /d "%~dp0"
title Desafio Total - Servidor

echo ==========================================
echo        INICIANDO O DESAFIO TOTAL
echo ==========================================
echo.
where py >nul 2>nul
if errorlevel 1 (
  echo ERRO: O Python nao foi encontrado.
  echo Instale o Python 3.10 ou superior em https://www.python.org/downloads/
  echo Durante a instalacao, marque a opcao para adicionar o Python ao PATH.
  pause
  exit /b 1
)

echo [1/2] Instalando/verificando os componentes necessarios...
py -m pip install -r requirements.txt
if errorlevel 1 (
  echo.
  echo ERRO ao instalar os componentes. Confira sua conexao com a internet.
  pause
  exit /b 1
)

echo.
echo [2/2] Abrindo o servidor do jogo...
echo Quando o navegador abrir, voce podera entrar ou clicar em CRIAR CONTA.
echo Para fechar o servidor, volte a esta janela e pressione Ctrl+C.
start "" /b cmd /c "timeout /t 3 /nobreak >nul & start http://127.0.0.1:5000"
py backend\app.py
if errorlevel 1 (
  echo.
  echo O servidor foi encerrado com um erro. Veja a mensagem acima.
  pause
)
