pipeline {
  agent {
    node {
      label 'test'
    }
    
  }
  stages {
    stage('test') {
      parallel {
        stage('test') {
          steps {
            sh 'echo lalala'
          }
        }
        stage('test2') {
          steps {
            sleep 12
          }
        }
      }
    }
    stage('end') {
      steps {
        echo 'ending'
      }
    }
  }
}