pipeline{
    agent any
     parameters {
        choice(name: 'branch', choices: ['main', 'wavefront','emailtesting'], description: 'branch name')
        string(name: 'maven_build', defaultValue: 'package', description: 'maven build')
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
        stage ('build'){
            steps{
                sh "mvn ${params.maven_build}"
            }
        }
    }
         post {
        always {
            echo 'Job completed'
            mail subject: "Build Completed for Jenkins JOB $env.JOB_NAME", 
                  body: "Build Completed for Jenkins JOB $env.JOB_NAME \n Click Here: $env.JOB_URL", 
                  to: 'nagulapally.raj@gmail.com'
        }
        failure {
            mail subject: "Build Failed for Jenkins JOB $env.JOB_NAME with Build ID $env.BUILD_ID", 
                  body: "Build Failed for Jenkins JOB $env.JOB_NAME", 
                  to: 'nagulapally.raj@gmail.com' 
        }
        success {
            junit '**/surefire-reports/*.xml'
        }
}
}