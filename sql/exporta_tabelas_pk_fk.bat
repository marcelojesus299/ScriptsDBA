@echo off
setlocal enabledelayedexpansion

REM === CONFIGURAÇÕES ===
set PGPASSWORD=P@$$w0rd
set USUARIO=postgres
set HOST=localhost
set PORTA=5432
set DATABASE=evolve_test
set ARQUIVO_SAIDA=estrutura_completa.sql
set ARQUIVO_FILTRADO=dump_tabelas_pk_fk_idx.sql

REM === GERA O DUMP ===
pg_dump -U %USUARIO% -h %HOST% -p %PORTA% -d %DATABASE% ^
  --schema-only ^
  --no-owner --no-comments --no-publications --no-subscriptions ^
  --no-privileges --no-tablespaces --no-security-labels --no-unlogged-table-data ^
  -f %ARQUIVO_SAIDA%

REM === FILTRA SOMENTE TABELAS, PKs, FKs, ÍNDICES ===
(
  powershell -Command ^
  "$inTable = $false; Get-Content '%ARQUIVO_SAIDA%' | ForEach-Object {
    if ($_ -match '^CREATE TABLE') { $inTable = $true; $block = $_ } 
    elseif ($inTable) { $block += \"`n$_\"; if ($_ -match '^\);') { $inTable = $false; Write-Output $block; $block = '' } }
    elseif ($_ -match '^ALTER TABLE.*ADD CONSTRAINT.*(PRIMARY KEY|FOREIGN KEY)') { Write-Output $_ }
    elseif ($_ -match '^CREATE (UNIQUE )?INDEX') { Write-Output $_ }
  }" 
) > %ARQUIVO_FILTRADO%

echo Dump filtrado criado com sucesso: %ARQUIVO_FILTRADO%
pause
