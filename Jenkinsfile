pipeline{
    agent {label 'NODEJS'}
     triggers { 
        pollSCM('* * * * *') 
     }
   
    stages {
        stage ('vcs')
        {
            steps{
                mail subject: "build started for Jenkins JOB $env.JOB_NAME",
                     body   : "build started for Jenkins JOB $env.JOB_NAME",
                     to     : 'nagulapally.raj@gmail.com'
              git url: 'https://github.com/rajujaggu/spring-petclinic.git',
                  branch: 'dockerpractice1'
            }
        }
        stage('Package build & Sonar'){
            steps{
                withSonarQubeEnv('SONAR_D') {
                sh "mvn package sonar:sonar"
              }
            }
        }
        // stage("Quality Gate") {
        //     steps {
        //       timeout(time: 30, unit: 'MINUTES') {
        //         waitForQualityGate abortPipeline: true
        //       }
        //     }
        // }
        stage ('Artifactory configuration') {
            steps {
                rtServer (
                    id: "jfrog_cicd",
                    url: 'https://rajreddy.jfrog.io',
                    credentialsId: "jfrog_cicd_admin"
                )
            }
        }
        
        stage ('build image'){
            steps{
            sh "docker image build  -t spcimage:1.0 ."
            sh "docker image tag spcimage:1.0 rajreddy.jfrog.io/docker-local/spc1:1.0"
            }
        }
        stage ('Push image to Artifactory') {
            steps {
                rtDockerPush(
                    serverId: "jfrog_cicd",
                    image: 'rajreddy.jfrog.io/docker-local/spc2:1.0',
                    targetRepo: 'docker-remote')
    }
        }
    }
         
}