pipeline {
    agent any

    environment {
        PATH = "C:\\Users\\marcelo.jesus\\AppData\\Roaming\\npm;${env.PATH}" 
        DBDOCS_USERNAME = 'Marcelo Bruno'
        DB_URL = 'jdbc:postgresql://localhost:5432/evolve_teste'  // URL do banco de dados
        DB_USER = 'postgres'                             // Usuário do banco de dados
        DB_PASSWORD = 'P@$$w0rd'                           // Senha do banco de dados
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

        stage('Gerar DBML a partir do banco') {
            steps {
                dir('sql') {
                    // Gerar o arquivo .dbml a partir do banco de dados atualizado
                    bat "sql2dbml --db ${DB_URL} --user ${DB_USER} --password ${DB_PASSWORD} -o output.dbml"
                }
            }
        }

        stage('Verificar arquivo DBML gerado') {
            steps {
                dir('sql') {
                    bat 'dir output.dbml'  // Verifica se o arquivo output.dbml foi gerado
                }
            }
        }
    }
}
