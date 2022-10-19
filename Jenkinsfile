pipeline{
    agent {label 'MAVEN-BUILD'}
    parameters{ 
        choice(name: 'branch-name', choices: ['main', 'gh-pages'], description: 'branch demo')
        string(name: 'maven-build', defaultValue: 'package', description: 'maven build')
        }
    stages {
        stage ('vcs')
        {
            steps{
              git url:'https://github.com/rajujaggu/spring-petclinic.git',
              git branch:"${params.branch-name}"
            }
        }
        stage('build'){
            steps{
                sh "mvn ${params.maven-build}"
            }
        }
        stage('archive results'){
            steps{
                junit '**/surefire-reports/*.xml'
            }
        }

    }
}