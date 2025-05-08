pipeline {
    agent any

    environment {
        PATH = "C:\\Users\\marcelo.jesus\\AppData\\Roaming\\npm;${env.PATH}"
    }

    stages {
        stage('Clone do Repositório') {
            steps {
                git branch: 'main', url: 'https://github.com/marcelojesus299/ScriptsDBA.git'
            }
        }

        stage('Executar Flyway') {
            steps {
                bat 'flyway -configFiles=flyway.conf migrate'
            }
        }

        stage('Exportar schema com pg_dump') {
            steps {
                dir('sql') {
                    bat 'set PGPASSWORD=P@$$w0rd && pg_dump -U postgres -h localhost -p 5432 -d evolve_test --schema-only > schema.sql'
                }
            }
        }

        stage('Limpar funções do schema') {
            steps {
                dir('sql') {
                    writeFile file: 'clean-schema.ps1', text: '''
$inputFile = "schema.sql"
$outputFile = "schema_clean.sql"

$content = Get-Content $inputFile -Raw
$content = [regex]::Replace($content, "CREATE\\s+FUNCTION.*?\\$\\$.*?\\$\\$.*?;", "", 'Singleline,IgnoreCase')
Set-Content -Path $outputFile -Value $content
'''
                    bat 'powershell -ExecutionPolicy Bypass -File clean-schema.ps1'
                }
            }
        }

        stage('Gerar DBML com sql2dbml') {
            steps {
                dir('sql') {
                    bat 'sql2dbml schema_clean.sql -o output.dbml'
                }
            }
        }
    }
}
