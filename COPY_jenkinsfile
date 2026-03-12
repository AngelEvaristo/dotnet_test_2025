pipeline {
  agent any

  stages {
    stage('Checkout') {
      steps { checkout scm }
    }

    stage('Restore') {
      steps { powershell 'scripts/restore.ps1' }
    }

    stage('Build') {
      steps { powershell 'scripts/build.ps1' }
    }

    stage('Test') {
      steps { powershell 'scripts/test.ps1' }
    }
  }

  post {
    success {
      echo 'CI .NET completado correctamente'
    }
    failure {
      echo 'CI fallo. Revisar logs de consola.'
    }
    always {
      archiveArtifacts artifacts: 'TestResults/*.trx', allowEmptyArchive: true
    }
  }
}
