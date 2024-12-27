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
        sh '''pipeline {
    agent any

    stages {
        stage(\'Build Docker Image\') {
            steps {
                script {
                    docker.build(\'my-build-image\', \'/home/duman/cicd-pipeline\')
                }
            }
        }
        stage(\'Run Docker Container\') {
            steps {
                script {
                    docker.image(\'my-build-image\').run(\'-d -p 3000:3000\')
                }
            }
        }
    }
}'''
        }
      }

    }
  }