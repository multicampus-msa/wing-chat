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
import groovy.transform.Field

@Field String defaultChannel = '#jenkins-channel'
@Field String channelToken = 'QO9lXi8yz3Xm7blCvKHKLer2'

def sendStart(msg) {
    sendMsg(defaultChannel, '61E858', '*[PR] '+ msg +' 배포시작*')
}
def sendSuccess(msg) {
    sendMsg(defaultChannel, '61E858', '*[PR] '+ msg +' 배포완료*')
}
def sendError(msg) {
    sendMsg(defaultChannel, 'E80503', '*[PR] '+ msg +' 배포실패*')
}
def sendMsg(chnl, color, msg) {
    slackSend baseUrl: 'https://multicampus-msa.slack.com/services/hooks/jenkins-ci/', channel: chnl,  color: color, message: msg , token: channelToken
}