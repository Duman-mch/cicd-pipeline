pipeline {
  agent any
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
        sh 'chmod +x scripts/build.sh'
        sh 'docker build --platform linux/arm64 -t my-build-image .'
      }
    }

  }
}