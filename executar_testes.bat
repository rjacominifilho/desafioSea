@echo off
REM Script para executar testes Robot Framework no Windows

echo Ativando ambiente virtual...
call venv\Scripts\activate.bat

echo Iniciando todos os testes no Chrome...
REM O parametro -d diz ao Robot para jogar os resultados na pasta 'results'
robot -d results/chrome -v BROWSER:chrome Tests

echo Iniciando todos os testes no Firefox...
robot -d results/firefox -v BROWSER:firefox Tests

echo Todos os testes foram finalizados! Verifique a pasta 'results' para ver os relatorios.
pause
