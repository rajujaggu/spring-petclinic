pipeline{
    agent {label 'NODEJS'}
     parameters {
        choice(name: 'branch', choices: ['main', 'dockerpractice1','emailtesting'], description: 'branch name')
     }
   
    stages {
        stage ('vcs')
        {
            steps{
                mail subject: "build started for Jenkins JOB $env.JOB_NAME",
                     body   : "build started for Jenkins JOB $env.JOB_NAME",
                     to     : 'nagulapally.raj@gmail.com'
              git url: 'https://github.com/rajujaggu/spring-petclinic.git',
                  branch: "${params.branch}"
            }
        }
        stage ('Artifactory configuration') {
            steps {
                rtServer (
                    id: "jfrog_cicd",
                    url: 'https://rajreddy.jfrog.io',
                    credentialsId: "jfrog_cicd_admin"
                )
            }
        }
        stage ('build'){
            steps{
            sh "docker image build  -t spcimage:1.0 ."
            sh "docker image tag spcimage:1.0 rajreddy999/spc1:1.0"
            }
        }
        stage ('Push image to Artifactory') {
            steps {
                rtDockerPush(
                    serverId: "jfrog_cicd",
                    image: 'rajreddy999/spc1:1.0',
                    // Host:
                    // On OSX: "tcp://127.0.0.1:1234"
                    // On Linux can be omitted or null
                    targetRepo: 'docker-remote')
    }
        }
    }
         
}