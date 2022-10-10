pipeline {
  agent any
  tools {
    terraform 'terraform'
  }
  options {
    skipDefaultCheckout(true)
  }
  stages {
    stage('clean workspace') {
      steps {
        cleanWs()
      }
    }
    stage('checkout') {
      steps {
        checkout scm
        sh 'export AWS_ACCESS_KEY_ID     = credentials(jenkins-aws-secret-key-id)'
        sh 'export AWS_SECRET_ACCESS_KEY = credentials(jenkins-aws-secret-access-key)'
        sh 'export AWS_DEFAULT_REGION = credentials(jenkins-aws-region)''
      }
    }
    stage('terraform init') {
      steps {
        sh 'terraform init'
      }
    }
    stage('terraform plan') {
      steps {
        sh 'terraform plan'
      }
    }
    stage('terraform apply') {
      steps {
        sh 'terraform apply -auto-approve -no-color'
      }
    }
    stage('terraform destroy') {
      steps {
        sh 'terraform destroy -auto-approve -no-color'
      }
    }
  } 
  post {
    always {
      cleanWs()
    }
  }
}
