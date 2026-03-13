// Demo pipeline usando la librería compartida
@Library('shared-lib@main') _

import org.example.Utils
import org.example.StringTools

pipeline {
  agent any
  environment {
    GREETING_PREFIX = 'Hola'
  }
  stages {
    stage('Build') {
      steps {
        script {
          sayHello('Equipo')
          greetWithEnv('devs')
          printBanner('Build')

          def tag = Utils.buildTag(env.BRANCH_NAME ?: 'local', env.BUILD_NUMBER ?: '0')
          echo "Tag de build: ${tag}"

          def title = StringTools.titleCase('pipeline de ejemplo')
          echo "Titulo: ${title}"
        }
      }
    }
    stage('Notify') {
      steps {
        notifySlack('#dev', "Build ${env.BUILD_NUMBER ?: '0'} OK")
        renderMessage('Equipo', env.BUILD_NUMBER ?: '0', 'SUCCESS')
      }
    }
  }
}
