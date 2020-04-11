env.DOCKER_REGISTRY = 'ikhsannugs'
env.DOCKER_IMAGE_NAME = 'laravel'
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
          sh 'sed -i "s/versi/$BUILD_NUMBER/g" laravel2.yaml'
          sh 'sed -i "s/tujuan_server/$BRANCH_NAME/g" laravel2.yaml' 
          sh "kubectl apply -f laravel2.yaml"
        }
      }
    }
}
