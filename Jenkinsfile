pipeline {
  environment {
    registry = "mohammadathar/django-file-uploader"
    registryCredential = 'dockerhub_credentials'
    dockerImage = ''
  }
  agent any
  stages {
    stage('Cloning our repo') {
      steps {
        git 'https://github.com/atharshah1/containerised-app-with-CI-CD.git'
      }
    }
    stage('Building our app image') {
      steps {
        script {
          dockerImage = docker.build env.registry
        }
      }
    }
    stage('pushing our app image to docker hub') {
      steps {
        script {
          docker.withRegistry('', env.registryCredential) {
            dockerImage.push()
          }
        }
      }
    }
    stage('Cleaning up the image build') {
      steps {
        sh "docker rmi ${env.registry}"
      }
    }
  }
}
stage('deploying app to staging environment') {
  steps {
    sh "docker-compose up"
  }
}
}
}
