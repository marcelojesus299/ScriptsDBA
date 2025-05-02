pipeline {
    agent any

    stages {
        stage('Clone do Repositório') {
            steps {
                git branch: 'main' , url: 'https://github.com/marcelojesus299/ScriptsDBA.git'
            }
        }

        stage('Executar Flyway') {
            steps {
                
                    bat 'flyway -configFiles=flyway.conf migrate'
                
            }
        }

        stage('Gerar Diagrama DB') {
            steps {
                // Gera o diagrama do banco de dados usando o dbdiagram.io
                dir('sql') {
                    bat 'sql2dbml input.sql -o output.dbml'
                }
            }
        }

        stage('Gerar Documentação DB') {
            steps {
                // Gera a documentação do banco de dados usando o dbdocs
                dir('sql') {
                    bat 'dbdocs generate --input . --output db_documentation.html'
                }
            }
        }

        stage('Deploy') {
            steps {
                // Realize o deploy ou qualquer outra etapa desejada
                echo 'Deploy completed.'
            }
        }
    }
}
