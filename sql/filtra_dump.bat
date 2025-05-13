# Define a pasta onde estão os arquivos
$PASTA = "C:\Users\marcelo.jesus\Documents\MarceloGit\ScriptsDBA\sql"

# Define os caminhos dos arquivos de entrada e saída
$entrada = "$PASTA\estrutura_completa.sql"
$saida = "$PASTA\dump_tabelas_pk_fk_idx.sql"

# Verifica se o arquivo de entrada existe
if (Test-Path $entrada) {
    # Lê todo o conteúdo do arquivo
    $conteudo = Get-Content $entrada -Raw

    # Separa os comandos pelo ponto e vírgula seguido de nova linha
    $comandos = $conteudo -split ';\s*`r?`n'

    # Filtra comandos de criação de tabelas, constraints, índices e sequences
    $filtrados = $comandos | Where-Object {
        $_ -match '^CREATE TABLE' -or
        $_ -match '^ALTER TABLE.*ADD CONSTRAINT.*(PRIMARY KEY|FOREIGN KEY|UNIQUE|CHECK)' -or
        $_ -match '^CREATE (UNIQUE )?INDEX' -or
        $_ -match '^CREATE SEQUENCE'
    }

    # Se houver comandos filtrados, salva no arquivo de saída
    if ($filtrados.Count -gt 0) {
        $filtrados = $filtrados | Where-Object { $_ -ne '' }
        $filtrados | ForEach-Object { "$_;`n" } | Set-Content $saida -Encoding UTF8
        Write-Host "Arquivo filtrado criado com sucesso: $saida"
    } else {
        Write-Host "Nenhum comando correspondente encontrado no arquivo de entrada."
    }
} else {
    Write-Host "Arquivo de entrada não encontrado: $entrada"
}
