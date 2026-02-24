pipeline {
    agent { label 'ecs-agent' } // exactly the same as the label in Jenkins

    environment {
        AWS_REGION = 'us-east-1'
        ACCOUNT_ID = '514985057519'
        ECR_REPO = 'jenkins-app'
        CLUSTER_NAME = 'jenkins-fargate-cluster'
        SERVICE_NAME = 'jenkins-task-service'
        IMAGE_TAG = "${env.BUILD_NUMBER}"
    }

    options {
        timestamps()
    }

    stages {

        stage('Checkout Source Code') {
            steps {
                echo "Cloning repository..."
                git branch: 'main',
                    url: 'https://github.com/Eniyonta/Jenkins.git'
            }
        }

        stage('Build Docker Image') {
            steps {
                echo "Building Docker image..."
                sh '''
                docker build -t jenkins-app:$IMAGE_TAG .
                '''
            }
        }

        stage('Login to Amazon ECR') {
            steps {
                echo "Logging into ECR..."
                sh '''
                aws ecr get-login-password --region $AWS_REGION | \
                docker login --username AWS --password-stdin \
                $ACCOUNT_ID.dkr.ecr.$AWS_REGION.amazonaws.com
                '''
            }
        }

        stage('Tag Docker Image') {
            steps {
                sh '''
                docker tag jenkins-app:$IMAGE_TAG \
                $ACCOUNT_ID.dkr.ecr.$AWS_REGION.amazonaws.com/$ECR_REPO:$IMAGE_TAG
                '''
            }
        }

        stage('Push Image to ECR') {
            steps {
                echo "Pushing image to ECR..."
                sh '''
                docker push \
                $ACCOUNT_ID.dkr.ecr.$AWS_REGION.amazonaws.com/$ECR_REPO:$IMAGE_TAG
                '''
            }
        }

        stage('Deploy to ECS Fargate') {
            steps {
                echo "Triggering ECS deployment..."
                sh '''
                aws ecs update-service \
                --cluster $CLUSTER_NAME \
                --service $SERVICE_NAME \
                --force-new-deployment \
                --region $AWS_REGION
                '''
            }
        }
    }

    post {
        success {
            echo '🚀 Deployment to AWS Fargate Successful!'
        }
        failure {
            echo '❌ Pipeline Failed!'
        }
    }
}


