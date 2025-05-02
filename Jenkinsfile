pipeline {
    agent any

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
    }
}
