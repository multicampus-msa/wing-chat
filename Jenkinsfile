node {
    stage('Start'){
        agent any
        steps{
            slackSend(channel:'#jenkins-channel', color:'#FFFF00', message: "STARTED: Job '${env.JOB_NAME} [${env.BUILD_NUMBER}]' (${env.BUILD_URL})")
        }
    }
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
     post{
         success{
            slackSend(channel:'#jenkins-channel', color:'#00FF00', message: "SUCCESSFUL: Job '${env.JOB_NAME} [${env.BUILD_NUMBER}]' (${env.BUILD_URL})")
            
         }
         failure{
            slackSend(channel:'#jenkins-channel', color:'#FF0000', message: "FAILED: Job '${env.JOB_NAME} [${env.BUILD_NUMBER}]' (${env.BUILD_URL})")

         }
     }
 }