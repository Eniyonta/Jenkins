pipeline {
    agent any

    stages {
        stage('Clone') {
            steps {
                git 'https://github.com/Eniyonta/Jenkins.git'
            }
        }

        stage('Build') {
            steps {
                echo 'Building application...'
                sh 'echo Build Successful'
            }
        }

        stage('Test') {
            steps {
                echo 'Running tests...'
            }
        }

        stage('Deploy') {
            steps {
                echo 'Deployment Complete'
            }
        }
    }
}
