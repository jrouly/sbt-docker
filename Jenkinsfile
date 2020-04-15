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
          sh """
            docker build . -t jrouly/sbt:$version --build-arg SBT_VERSION=$version
          """
        }
      }
    }

    stage("pushing sbt-docker $version") {
      script {
        docker.withRegistry('', 'docker-hub') {
          sh """
            docker push jrouly/sbt:$version
          """
        }
      }
    }
  }
}

pipeline {

  agent any

  options {
    timeout(time: 15, unit: 'MINUTES')
    timestamps()
    ansiColor('xterm')
  }

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
