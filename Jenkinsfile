pipeline {
  agent {
    label 'docker'
  }
  environment {
    CI = 'true'
  }
  stages {
    stage('Start') {
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
          agent {
            docker {
              label  'docker'
              image 'node:10-alpine'
              args '--name docker-node'
            }
          }
          steps {
            sh 'docker-compose -f docker-compose.test.yml up'
          }
        }
      }
    }
  }
}
