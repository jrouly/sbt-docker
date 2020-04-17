pipeline {

  agent any

  options {
    timeout(time: 1, unit: 'HOURS')
    timestamps()
    ansiColor('xterm')
  }

  parameters {
    booleanParam(name: 'build_preloaded', defaultValue: false, description: 'build preloaded images')
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
