pipeline {
    agent any

    stages {
        stage('Clone do Repositório') {
            steps {
                git 'https://github.com/marcelojesus299/ScriptsDBA.git'
            }
        }

        stage('Executar Flyway') {
            steps {
                bat 'flyway -configFiles=flyway.conf migrate'
            }
        }
    }
}
