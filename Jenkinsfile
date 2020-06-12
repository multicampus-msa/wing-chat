node {
     stage('Clone repository') {
         checkout scm
     }
     tools {nodejs "node"}
     stage('yarn build') {
         sh 'npm install -g yarn'
         sh 'yarn install'
         sh 'yarn build'
     }

     stage('Build & Push image') {
          docker.withRegistry('https://registry.hub.docker.com', 'midaslmg94-docker') {
             def image = docker.build("midaslmg94/wing-chat:latest")
             image.push()
             sh 'sudo docker service update --image midaslmg94/wing-chat wing-chat'
         }
     }
 }