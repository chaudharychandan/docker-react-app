pipeline {
  agent any
  environment {
    CI = 'true'
  }
  stages {
    stage('Start') {
      when {
        changeRequest target: 'master'
      }
      stages {
        stage('Installation') {
          steps {
            sh 'pyenv global 3.7.1'
            sh 'pip install -U pip'
            sh 'pip install awscli'
            sh 'chmod -R 777 jenkins'
            sh "export PATH=$HOME/.local/bin:$PATH"
          }
        }
        stage('Setup') {
          steps {
            sh './jenkins/setup.sh'
          }
        }
        stage('Test') {
          agent {
            docker {
              image 'node:10-alpine'
              args '--name docker-node'
            }
          }
          steps {
            sh 'docker-compose -f docker-compose.test.yml up'
          }
        }
        stage('Build') {
          agent {
            docker {
              image 'node:10-alpine'
              args '--name docker-node'
            }
          }
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
  }
}
