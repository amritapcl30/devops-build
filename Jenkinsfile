pipeline {
    agent any

    stages {

        stage('DEV Build & Deploy') {
            when {
                branch 'dev'
            }
            steps {
                sh 'chmod +x build.sh deploy.sh'
                sh './build.sh dev'
                sh './deploy.sh dev'
            }
        }

        stage('PROD Build & Deploy') {
            when {
                branch 'master'
            }
            steps {
                sh 'chmod +x build.sh deploy.sh'
                sh './build.sh prod'
                sh './deploy.sh prod'
            }
        }
    }
}
