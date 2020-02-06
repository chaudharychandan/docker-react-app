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
    stage('Setup') {
      steps {
        sh 'pyenv global 3.7.1'
        sh 'pip install -U pip'
        sh 'pip install awscli'
        sh 'chmod -R 777 jenkins'
        sh 'export PATH=$HOME/.local/bin:$PATH'
        sh './jenkins/setup.sh'
      }
    }
    stage('Test') {
        steps {
            sh 'docker-compose -f docker-compose.test.yml up'
        }
    }
    stage('Build') {
      steps {
        sh './jenkins/pull.sh'
        sh './jenkins/build.sh'
      }
    }
    stage('Deliver') {
      steps {
        sh './jenkins/push.sh'
      }
    }
  }
}
