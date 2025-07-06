pipeline{
    agent any
        environment {
        DOCKER_IMAGE = 'anilkumar061/vinayakacaable:latest'
    }
      stages {
        stage('Clone Repository') {
            steps {
                git 'https://github.com/anilkumar-n-061/vinayakacable.git'
            }
        }
        stage('Bulid Docker Image') {
            steps{
                sh '''
                docker build -t $DOCKER_IMAGE .    
               '''
            }
        }
        stage('Login to Docker Hub'){
            steps{
                 withCredentials([usernamePassword(credentialsId: 'docker-hub-credentials', usernameVariable: 'DOCKER_USERNAME', passwordVariable: 'DOCKER_PASSWORD')]) {
                        sh "echo $DOCKER_PASSWORD | docker login -u $DOCKER_USERNAME --password-stdin"
                    }
               }
          }
        stage('Push Docker Image'){
            steps{
                sh 'docker push $DOKER_IMAGE'
            }
        }
        stage('Deploy Kubernets'){
            steps{
                sh  '''
                kubectl apply -f delpoy.yaml
                 '''
            }
        }
    }
}
