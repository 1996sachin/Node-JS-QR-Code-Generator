pipeline {
    agent any

    stages {
        stage('Checkout') {
            steps {
                git branch: 'main', url: 'https://github.com/1996sachin/Node-JS-QR-Code-Generator.git'
            }
        }

        stage('Install Dependencies') {
            steps {
                sh 'npm install'
                sh 'npm install pm2 --save'
            }
        }

        stage('Test') {
            steps {
                echo 'No tests configured'
            }
        }

        stage('Deploy') {
            steps {
                sh '''
                   pm2 delete qr-app || true
                   pm2 start index.js --name qr-app
                   pm2 save
                   '''
            }
        }
    }
}
