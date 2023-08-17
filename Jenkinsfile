pipeline {
  agent any
  environment {
    AWS_ACCESS_KEY_ID = credentials('ACCESS_KEY')
    AWS_SECRET_ACCESS_KEY = credentials('SECRET_ACCESS_KEY')
    AWS_DEFAULT_REGION = "us-east-1"
    PRIVATE-KEY = credentials('JENKINS-KEY')
  }
  stages {
    stage('Checkout Code') {
      steps {
        git(url: 'https://github.com/metiko/CSP-G21', branch: 'ansible')
      }
    }

    // stage('Provision Infrastructure') {
    //   steps {
    //     dir('terraform')
    //     sh 'terraform init'
    //     sh 'terraform plan'
    //     sh 'terraform apply' 
    //   }
    // }

    stage('Deploy Wordpress to production') {
      steps {
        dir('ansible')
        sh 'ansible-playbook -i inventory.txt deploy.yml --private-key=$PRIVATE-KEY'
      }
    }
}