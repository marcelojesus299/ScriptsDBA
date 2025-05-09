pipeline {
    agent any

    environment {
        PATH = "C:\\Users\\marcelo.jesus\\AppData\\Roaming\\npm;${env.PATH}"
        DBDOCS_USERNAME = 'Marcelo Bruno'
        DB_URL = 'jdbc:postgresql://localhost:5432/evolve_test'
        DB_USER = 'postgres'
        DB_PASSWORD = 'P@$$w0rd'
        PGPASSWORD = 'P@$$w0rd' // <- variável necessária para pg_dump
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
		
		stage('Atualizar diagrama no dbdocs') {
			steps {
				dir('sql') {
					withEnv(["DBDOCS_TOKEN=eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6MTA5NjE3LCJ0b2tlbiI6Ijc5NjZiMGVmMDVlZGY3NDMyODkyNzM5NjVkYzI2MDhjIiwiaWF0IjoxNzQ2NzUxMzcxfQ.LKipP6ZiD9CRYWv1IesxlxtDKUCDQXMB4zH4ekUBppk"]) {
						bat 'dbdocs push output.dbml'
            }
        }
    }
}

    }
}
