pipeline {
  agent any
  environment {
    DOCKER_IMAGE = 'dumanmch2024/duman_build_image:latest' // Укажи свое имя образа
  }
  stages {
    stage('Build') {
      steps {
        sh 'chmod +x scripts/build.sh'
        sh './scripts/build.sh'
      }
    }
    stage('Test') {
      steps {
        sh 'chmod +x scripts/build.sh'
        sh './scripts/test.sh'
      }
    }
    stage('Build Docker Image') {
            steps {
                script {
                    docker.build('duman_build_image')
                }
            }
        }
    stage('Login to Docker Hub') {
      steps {
        withCredentials([usernamePassword(credentialsId: 'dockerhub-credentials', usernameVariable: 'DOCKER_USERNAME', passwordVariable: 'DOCKER_PASSWORD')]) {
          script {
            sh '''
            echo "$DOCKER_PASSWORD" | docker login -u "$DOCKER_USERNAME" --password-stdin
            '''
          }
        }
      }
    }
    stage('Push to Docker Hub') {
      steps {
        script {
          sh 'docker push $DOCKER_IMAGE'
        }
      }
    }
  }
}
