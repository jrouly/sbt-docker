pipeline {

  agent any

  parameters {
    string(defaultValue: 'x.x.x', description: 'Which version of sbt to build?', name: 'SBT_VERSION')
  }

  stages {
    stage('Docker Build') {
      steps {
        script {
          docker.withRegistry('', 'docker-hub') {
            docker
              .build("jrouly/sbt:$SBT_VERSION", "--build-arg SBT_VERSION=$SBT_VERSION .")
              .push()
          }
        }
      }
    }
  }

  post {
    success {
      script {

        currentBuild.description = "$SBT_VERSION"
      }
    }
  }
}
