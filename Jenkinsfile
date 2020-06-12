node {
         stage('Clone repository') {
             checkout scm
         }
         stage('npm build') {
            env.NODEJS_HOME = "${tool 'nodejs'}"
         	env.PATH="${env.NODEJS_HOME}/bin:${env.PATH}"

            sh 'npm install'
         }
     stage('Build & Push image') {
          docker.withRegistry('https://registry.hub.docker.com', 'midaslmg94-docker') {
             def image = docker.build("midaslmg94/wing-chat:latest")
             image.push()
             sh 'sudo docker service update --image midaslmg94/wing-chat wing-chat'
         }
     }
 }