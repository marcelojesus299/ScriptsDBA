# Caminhos absolutos
$entrada = "C:\Users\marcelo.jesus\Documents\MarceloGit\ScriptsDBA\sql\estrutura_completa.sql"
$saida   = "C:\Users\marcelo.jesus\Documents\MarceloGit\ScriptsDBA\sql\dump_tabelas_pk_fk_idx.sql"


# Lê todo o conteúdo como um único bloco
$conteudo = Get-Content $entrada -Raw

# Separa todos os comandos SQL
$comandos = $conteudo -split ";\s*`r?`n"

# Filtra os comandos desejados
$filtrados = $comandos | Where-Object {
    ($_ -match '^CREATE TABLE') -or
    ($_ -match '^ALTER TABLE.*ADD CONSTRAINT.*(PRIMARY KEY|FOREIGN KEY|UNIQUE|CHECK)') -or
    ($_ -match '^CREATE (UNIQUE )?INDEX') -or
    ($_ -match '^CREATE SEQUENCE')
}

# Salva com ponto e vírgula ao final
$filtrados | ForEach-Object { "$_;`n" } | Set-Content $saida -Encoding UTF8

Write-Host "Arquivo gerado com sucesso: $saida"
