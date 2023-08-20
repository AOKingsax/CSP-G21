pipeline {
  agent any
  environment {
    AWS_ACCESS_KEY_ID = credentials('ACCESS_KEY')
    AWS_SECRET_ACCESS_KEY = credentials('SECRET_ACCESS_KEY')
    AWS_DEFAULT_REGION = "us-east-1"
    PRIVATE_KEY = credentials('JENKINS-KEY')
    RP = credentials('ROOT_PASSWORD')
    DBN = credentials('DATABASE_NAME')
    USR = credentials('USER')
    USR_PSD = credentials('USER_PASSWORD')
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

    stage('Create env variable for docker compose') {
      steps {
        dir('ansible/roles/wordpress/files/') {
          sh 'sh ./env.sh'
        }
      }
    }

    stage('Confirm if env variable was created') {
      steps {
        dir('ansible/roles/wordpress/files/') {
          sh 'echo .env'
        }
      }
    }

    stage('Deploy Wordpress to production') {
      steps {
        dir('ansible') {
          sh 'ansible-playbook -i inventory.txt deploy.yml --private-key=$PRIVATE_KEY'
        }
      }
    }
}
}