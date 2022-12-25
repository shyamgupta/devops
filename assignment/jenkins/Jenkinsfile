pipeline{
    agent {label 'appserver'}
    stages{
        stage('checkout'){
            steps{
                checkout([$class: 'GitSCM', branches: [[name: '*/master']], extensions: [], userRemoteConfigs: [[url: 'https://github.com/shyamgupta/apprepo.git']]])
            }
        }
        stage('build and push image to ecr'){
            steps{
                sh '''docker build -t sgecr .
                docker tag sgecr:latest 931487333316.dkr.ecr.us-east-1.amazonaws.com/sgecr:latest
                docker push 931487333316.dkr.ecr.us-east-1.amazonaws.com/sgecr:latest'''
            }
        }
        stage('run container'){
            steps{
                sh '''docker run -d -p 8080:8080 931487333316.dkr.ecr.us-east-1.amazonaws.com/sgecr:latest'''
            }
        }
}
}
