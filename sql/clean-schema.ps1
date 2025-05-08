$inputFile = "schema.sql"
$outputFile = "schema_clean.sql"

# Lê o conteúdo inteiro como texto único
$content = Get-Content $inputFile -Raw

# Remove todas as funções: bloco CREATE FUNCTION ... $$ ... $$;
# Isso pega inclusive BEGIN ... END dentro do bloco
$content = [regex]::Replace($content, "CREATE\s+FUNCTION.*?\$\$.*?\$\$.*?;", "", 'Singleline,IgnoreCase')

# Escreve o conteúdo limpo
Set-Content -Path $outputFile -Value $content
