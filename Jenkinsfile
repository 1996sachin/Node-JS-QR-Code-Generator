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
                echo 'Starting Node.js QR Code Generator with PM2...'
                sh 'npx pm2 start index.js --name qr-generator || npx pm2 restart qr-generator'
            }
        }
    }
}
