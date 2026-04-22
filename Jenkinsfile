pipeline {
    agent any

    environment {
        IMAGE_NAME = 'my-new-project'
        CONTAINER_NAME = 'my-new-project-app'
    }

    stages {
        stage('Install Dependencies') {
            steps {
                sh 'npm install'
            }
        }

        stage('Build Docker Image') {
            steps {
                sh 'docker build --network host -t $IMAGE_NAME .'
            }
        }

        stage('Cleanup Old Container') {
            steps {
                sh 'docker stop $CONTAINER_NAME || true'
                sh 'docker rm $CONTAINER_NAME || true'
            }
        }

        stage('Deploy New Version') {
            steps {
                sh 'docker run -d --name $CONTAINER_NAME -p 3000:3000 $IMAGE_NAME'
            }
        }
    }
}
