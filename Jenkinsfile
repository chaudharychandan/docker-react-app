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
        stage('Initailize') {
          def dockerHome = tool 'jenkins-docker'
          env.PATH = "${dockerHome}/bin:${env.PATH}"
        }
        stage('Setup') {
          agent {
            docker {
              image 'node:10-alpine'
              args '--name docker-node'
            }
          }
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
