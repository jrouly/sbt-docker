pipeline {
  agent none
  parameters {
    string(defaultValue: 'x.x.x', description: 'Which version of sbt to build?', name: 'SBT_VERSION')
  }
  stages {
    stage('Docker Build') {
      steps {
        sh 'docker build -t jrouly/sbt:$SBT_VERSION --build-arg SBT_VERSION=$SBT_VERSION .'
      }
    }
  }
}
