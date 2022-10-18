env.DOCKER_REGISTRY = 'ikhsannugs'
env.DOCKER_IMAGE_NAME = 'laravel'
env.USERNAME = 'ikhsan-devops'
env.SERVER = '34.124.209.30'
pipeline {
  agent any 
    stages {
      stage('Git Check') {
        steps{
          sh "ls"
          sh "git --version"
          echo "Deployment TO ${env.BRANCH_NAME}" 
        }
      }
      stage('Build Docker Image') {
        steps{
          sh "docker build -t $DOCKER_REGISTRY/$DOCKER_IMAGE_NAME-$BRANCH_NAME:${BUILD_NUMBER} ."
        }
      }
      stage('Build Push Image') {
        steps{
          sh "docker push $DOCKER_REGISTRY/$DOCKER_IMAGE_NAME-$BRANCH_NAME:${BUILD_NUMBER}"
        }
      }
      stage('Deploy to Server') {
        steps{
          sshagent(credentials:['ssh-server-tujuan']){
            sh "ssh  -o StrictHostKeyChecking=no  $USERNAME@$SERVER docker container run -d -p --name $DOCKER_IMAGE_NAME $DOCKER_REGISTRY/$DOCKER_IMAGE_NAME-$BRANCH_NAME:${BUILD_NUMBER}"
        }
      }
    }
}
