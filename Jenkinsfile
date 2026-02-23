pipeline {
    agent any
    stages {
        stage('Clone') {
            steps {
                // Fetch your GitHub repo
                git branch: 'main', url: 'https://github.com/Eniyonta/Jenkins.git'
            }
        }
        stage('Build') {
            steps {
                echo 'Building application...'
                sh 'mkdir -p build && echo "App built successfully" > build/app.txt'
            }
        }
        stage('Test') {
            steps {
                echo 'Running tests...'
                sh 'test -f build/app.txt && echo "Tests passed" || echo "Tests failed"'
            }
        }
        stage('Deploy') {
            steps {
                echo 'Deploying application...'
                sh 'cp -r build deploy || echo "Deploy step simulated"'
            }
        }
    }
}
