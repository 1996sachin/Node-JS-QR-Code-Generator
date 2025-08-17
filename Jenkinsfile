pipeline {
    agent any

    environment {
        APP_NAME = 'qr-app-container'
        IMAGE_NAME = 'qr-app:latest'
        APP_PORT = '3000'
    }

    stages {
        stage('Checkout') {
            steps {
                git branch: 'main', url: 'https://github.com/1996sachin/Node-JS-QR-Code-Generator.git
            }
        }

        stage('Build Docker Image') {
            steps {
                echo "Building Docker image..."
                sh "docker build -t ${IMAGE_NAME} ."
            }
        }

        stage('Stop & Remove Old Container') {
            steps {
                echo "Stopping and removing old container if exists..."
                sh "docker rm -f ${APP_NAME} || true"
            }
        }

        stage('Run Container') {
            steps {
                echo "Running container..."
                sh "docker run -d -p ${APP_PORT}:${APP_PORT} --name ${APP_NAME} ${IMAGE_NAME}"
            }
        }

        stage('Clean Up Old Images') {
            steps {
                echo "Removing dangling images to save space..."
                sh "docker image prune -f"
            }
        }

        stage('Health Check') {
            steps {
                echo "Checking if app is running..."
                sh '''
                if curl -s http://localhost:3000 > /dev/null; then
                    echo "App is up and running"
                else
                    echo "App failed to start"
                    exit 1
                fi
                '''
            }
        }
    }

    post {
        success {
            echo "Deployment successful! App running on port ${APP_PORT}"
        }
        failure {
            echo "Deployment failed. Check logs for details."
        }
    }
}
