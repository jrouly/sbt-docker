def versions = [
  '1.3.8',
  '1.2.8',
  '1.1.6',
  '1.0.4',
  '0.13.18',
]

def build(String version) {
  return {
    stage("building sbt-docker $version") {
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

pipeline {

  agent any

  stages {
    stage('Docker Build') {
      steps {
        script {
          parallel versions.collectEntries {
            ["${it}": build(it)]
          }
        }
      }
    }
  }
}
