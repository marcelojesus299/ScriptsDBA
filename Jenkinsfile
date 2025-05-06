pipeline {
    agent any

    environment {
        PATH = "C:\\Users\\marcelo.jesus\\AppData\\Roaming\\npm;${env.PATH}" 
		DBDOCS_USERNAME = 'Marcelo Bruno'
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

        stage('Gerar DBML com sql2dbml') {
            steps {
                dir('sql') {
                    bat 'sql2dbml input.sql -o output.dbml'
                }
            }
        }

        stage('Gerar documentação dbdocs (local)') {
            steps {
                dir('sql') {
                    bat "dbdocs build output.dbml --username \"%DBDOCS_USERNAME%\""

                }
            }
        }
    }
}
