pipeline{
    agent {label 'MAVEN-BUILD'}
     parameters {
        choice(name: 'branch', choices: ['main', 'wavefront'], description: 'branch name')
        string(name: 'maven_build', defaultValue: 'package', description: 'maven build')
     }
   
    stages {
        stage ('vcs')
        {
            steps{
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

}