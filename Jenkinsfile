pipeline {
  agent any
  stages {
    stage('Load Remote Pipeline') {
      steps {
        // Clona el repo que tiene los pasos de pipeline
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

        // Carga el script remoto y ejecútalo
        script {
          def remote = load 'pipeline-remote/pipelines/buildAndTest.groovy'
          // true = usa scripts del repo del proyecto (sesion1-net-consumer)
          remote.call('Sesion1 .NET Consumer', false)
        }
      }
    }
  }
}
