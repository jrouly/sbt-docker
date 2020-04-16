pipeline {

  agent any

  options {
    timeout(time: 1, unit: 'HOURS')
    timestamps()
    ansiColor('xterm')
  }

  stages {
    stage('docker build') {
      steps {
        script {
          docker.withRegistry('', 'docker-hub') {
            sh './ci'
          }
        }
      }
    }
  }
}
