pipeline {
    agent any
    stages {
        stage('Clone') {
            steps {
                echo 'Cloning repo...'
                git branch: 'main', url: 'https://github.com/Eniyonta/Jenkins.git'
                sh 'sleep 3' // simulate clone duration
            }
        }
        stage('Build') {
            steps {
                echo 'Building application...'
                sh 'mkdir -p build && echo "App built" > build/app.txt'
                sh 'sleep 3' // simulate build time
            }
        }
        stage('Test') {
            steps {
                echo 'Running tests...'
                sh 'test -f build/app.txt && echo "Tests passed" || echo "Tests failed"'
                sh 'sleep 2' // simulate test time
            }
        }
        stage('Deploy') {
            steps {
                echo 'Deploying application...'
                sh 'mkdir -p deploy && cp -r build/* deploy/'
                sh 'sleep 2' // simulate deploy time
            }
        }
    }
}
