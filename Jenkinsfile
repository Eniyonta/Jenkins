pipeline {
    agent { label 'ecs-agent' }

    environment {
        AWS_REGION    = 'us-east-1'
        ACCOUNT_ID    = '514985057519'
        ECR_REPO      = 'jenkins-app'
        CLUSTER_NAME  = 'jenkins-fargate-cluster'
        SERVICE_NAME  = 'jenkins-task-service'
        IMAGE_TAG     = "${env.BUILD_NUMBER}"
    }

    options { timestamps() }

    stages {
        stage('Checkout') {
            steps {
                git branch: 'main', url: 'https://github.com/Eniyonta/Jenkins.git'
            }
        }

        stage('Build Docker Image') {
            steps {
                sh "docker build -t ${ECR_REPO}:${IMAGE_TAG} ."
            }
        }

        stage('Login to ECR') {
            steps {
                sh """
                aws ecr get-login-password --region ${AWS_REGION} | \
                docker login --username AWS --password-stdin ${ACCOUNT_ID}.dkr.ecr.${AWS_REGION}.amazonaws.com
                """
            }
        }

        stage('Tag Docker Image') {
            steps {
                sh "docker tag ${ECR_REPO}:${IMAGE_TAG} ${ACCOUNT_ID}.dkr.ecr.${AWS_REGION}.amazonaws.com/${ECR_REPO}:${IMAGE_TAG}"
            }
        }

        stage('Push to ECR') {
            steps {
                sh "docker push ${ACCOUNT_ID}.dkr.ecr.${AWS_REGION}.amazonaws.com/${ECR_REPO}:${IMAGE_TAG}"
            }
        }

        stage('Deploy to ECS') {
            steps {
                sh """
                aws ecs update-service \
                --cluster ${CLUSTER_NAME} \
                --service ${SERVICE_NAME} \
                --force-new-deployment \
                --region ${AWS_REGION}
                """
            }
        }
    }

    post {
        success { echo '🚀 Deployment successful!' }
        failure { echo '❌ Deployment failed!' }
    }
}

