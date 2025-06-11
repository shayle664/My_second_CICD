pipeline {
    agent { label 'docker-host' }

    environment {
        IMAGE_NAME = "secnd_cicd"
        IMAGE_TAG = "latest"
        CONTAINER_NAME = "flask-container"
    }

    stages {
        stage('Clone Repo') {
            steps {
                echo "Cloning repository..."
                checkout scm
            }
        }

        stage('Build Docker Image') {
            steps {
                script {
                    sh "docker build -t ${IMAGE_NAME}:${IMAGE_TAG} ."
                }
            }
        }

        stage('Run Container') {
            steps {
                script {
                    sh "docker run -d --rm --name ${CONTAINER_NAME} -p 5002:5002 ${IMAGE_NAME}:${IMAGE_TAG}"
                }
            }
        }

        stage('Test') {
            steps {
                script {
                    echo "Waiting for app to start..."
                    sleep 3
                    echo "Running test on http://localhost:5002 ..."
                    sh 'curl -o result.html http://localhost:5002'
		    archiveArtifacts artifacts: 'result.html'
                }
            }
        }

	stage('Push to dockerhub') {
            steps {
                echo "Push to dockerhub"
            }
        }

        stage('Cleanup') {
            steps {
                script {
                    sh "docker stop ${CONTAINER_NAME} || true"
                }
            }
        }
    }

    post {
        success {
            echo 'App test passed. Build OK.'
        }
        failure {
            echo 'App test failed. Build FAILED.'
        }
        always {
            echo 'Pipeline finished.'
        }
    }
}
