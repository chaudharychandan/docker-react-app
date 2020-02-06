pipeline {
  agent {
    docker {
      image 'node:10-alpine'
    }
  }
  environment {
    CI = 'true'
  }
  stages {
    stage('Test') {
        steps {
            sh 'npm install'
            sh 'npm run test'
        }
    }
    stage('Build') {
      steps {
        sh 'npm run build'
      }
    }
  }
}
