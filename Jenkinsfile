env.DOCKER_REGISTRY = 'ikhsannugs'
env.DOCKER_IMAGE_NAME = 'laravel'
node('master') {
    stage('Git Pull') {
          checkout scm
    }
      stage('Build Docker Image') {
          sh "docker build -t $DOCKER_REGISTRY/$DOCKER_IMAGE_NAME-$BRANCH_NAME:${BUILD_NUMBER} ."   
    }
      stage('Push Docker Image $BRANCH_NAME to Dockerhub') {
          sh "docker push $DOCKER_REGISTRY/$DOCKER_IMAGE_NAME-$BRANCH_NAME:${BUILD_NUMBER}"
    }
      stage('Deploy to Server $BRANCH_NAME') {
          sh 'sed -i "s/versi/$BUILD_NUMBER/g" laravel2.yaml'
          sh 'sed -i "s/tujuan_server/$BRANCH_NAME/g" laravel2.yaml' 
          sh "kubectl apply -f laravel2.yaml"
    }
    
}
