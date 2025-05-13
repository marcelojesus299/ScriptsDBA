@echo off
cd /d C:\dbdocs-preview

if not exist output.dbml (
    echo Arquivo output.dbml nao encontrado em C:\dbdocs-preview
    pause
    exit /b 1
)

echo Gerando documentação local...
dbdocs build output.dbml

pause
