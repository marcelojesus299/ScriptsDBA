pipeline {
    agent any

    environment {
        PATH = "C:\\Users\\marcelo.jesus\\AppData\\Roaming\\npm;${env.PATH}"
        DBDOCS_USERNAME = 'Marcelo Bruno'
        DB_URL = 'jdbc:postgresql://localhost:5432/evolve_test'
        DB_USER = 'postgres'
        DB_PASSWORD = 'P@$$w0rd'
        PGPASSWORD = 'P@$$w0rd'
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
                    bat 'pg_dump -U %DB_USER% -h localhost -p 5432 -d evolve_test --schema-only > schema.sql'
                }
            }
        }

        stage('Limpar funções do schema') {
            steps {
                dir('sql') {
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

		stage('Build local da documentação com dbdocs') {
			steps {
				dir('sql') {
					bat 'dbdocs build output.dbml --project Teste-Marcelo'
					bat 'start https://dbdocs.io/Marcelo%20Bruno/Teste-Marcelo'

				}
			}
		}


    }
}
