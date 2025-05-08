pipeline {
    agent any

    environment {
        PATH = "C:\\Users\\marcelo.jesus\\AppData\\Roaming\\npm;${env.PATH}" 
        DBDOCS_USERNAME = 'Marcelo Bruno'
        DB_URL = 'jdbc:postgresql://localhost:5432/evolve_test'
        DB_USER = 'postgres'
        DB_PASSWORD = 'P@$$w0rd'
		PGPASSWORD = 'P@$$w0rd'  // <- esta linha resolve o problema
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

        stage('Gerar Dump Estrutural (somente tabelas e chaves)') {
            steps {
                dir('sql') {
                    bat '''
					pg_dump -U %DB_USER% -h localhost -p 5432 -d evolve_test --no-owner --no-comments --no-publications --no-subscriptions --no-privileges --no-tablespaces --no-security-labels --no-unlogged-table-data -s -f dump_limpo.sql
                    '''
                }
            }
        }

        stage('Gerar DBML a partir do dump') {
            steps {
                dir('sql') {
                    bat 'dbml2sql dump_limpo.sql --postgres --output output.dbml'
                }
            }
        }

        stage('Verificar arquivo DBML gerado') {
            steps {
                dir('sql') {
                    bat 'dir output.dbml'
                }
            }
        }
    }
}
