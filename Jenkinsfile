pipeline {
    agent any

    environment {
        IMAGE_NAME = 'flask-app'
        DOCKER_TAG = 'latest'
    }

    stages {
        stage('Checkout') {
            steps {
                checkout scm
            }
        }

        stage('Build Docker Image') {
            steps {
                sh 'docker build -t $IMAGE_NAME:$DOCKER_TAG .'
            }
        }

        stage('Deploy') {
            steps {
                sh '''
                docker stop $IMAGE_NAME || true
                docker rm $IMAGE_NAME || true
                docker run -d --name $IMAGE_NAME -p 80:80 $IMAGE_NAME:$DOCKER_TAG
                '''
            }
        }
    }

    post {
        success { echo 'Pipeline completed successfully!' }
        failure { echo 'Pipeline failed. Check logs.' }
    }
}
