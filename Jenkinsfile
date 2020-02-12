pipeline {
  agent {
    label 'docker'
  }
  environment {
    CI = 'true'
  }
  stages {
    stage('Start') {
      agent {
        docker {
          label  'docker'
          image 'node:10-alpine'
          args '--name docker-node'
        }
      }
      when {
        changeRequest target: 'master'
        branch pattern: "feature-.*", comparator: "REGEXP"
      }
      stages {
        stage('Setup') {
          steps {
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
  }
}
