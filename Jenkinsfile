pipeline {
    agent any

    environment {
        DOCKER_HUB_CREDENTIALS = credentials('docker-hub-credentials')
        DOCKER_IMAGE_NAME = "hikue/comp367-lab2-q2t3"
        DOCKER_IMAGE_TAG = "latest"
    }

    stages {
        stage('Checkout') {
            steps {
                git branch: 'main', url: 'https://github.com/Hi-kue/comp367-khan-lab2-q2t3.git'
                echo 'Repository Checkout Successful!'
            }
        }

        stage('Build Maven Project') {
            steps {
                bat 'mvn clean package -DskipTests'
                echo 'Maven Build Successful!'
            }
        }

        stage('Docker Login') {
            steps {
                bat "echo %DOCKER_HUB_CREDENTIALS_PSW% | docker login -u %DOCKER_HUB_CREDENTIALS_USR% --password-stdin"
                echo 'Docker Hub Login Successful!'
            }
        }

        stage('Build Docker Image') {
            steps {
                bat "docker build -t ${DOCKER_IMAGE_NAME}:${DOCKER_IMAGE_TAG} ."
                echo 'Docker Image Build Successful!'
            }
        }

        stage('Push Docker Image') {
            steps {
                bat "docker push ${DOCKER_IMAGE_NAME}:${DOCKER_IMAGE_TAG}"
                echo 'Docker Image Push Successful!'
            }
        }
    }

    post {
        always {
            bat 'docker logout'
            echo 'Pipeline Successfully Completed.'
        }
    }
}