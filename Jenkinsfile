pipeline {
  agent any
  stages {
    stage('Load Remote Pipeline') {
      steps {
        script {
          // Checkout repo remoto en el MISMO workspace donde correrá el node
          dir('pipeline-remote') {
            checkout([
              $class: 'GitSCM',
              branches: [[name: '*/main']],
              userRemoteConfigs: [[
                url: 'https://github.com/AngelEvaristo/remote_jenkins_2025.git',
                credentialsId: 'AngelEvaristo'
              ]]
            ])
          }

          def remote = load 'pipeline-remote/pipelines/buildAndTest.groovy'
          remote.call('Sesion1 .NET Consumer', false) // false para usar scripts remotos
        }
      }
    }
  }
}
