pipeline{
    agent {label 'MAVEN-BUILD'}
    parameters{ 
        string(name: 'branch-name', defaultValue: 'main', description: 'branch name is main')
        string(name: 'maven-build', defaultValue: 'package', description: 'maven build')
        }
    stages {
        stage ('vcs')
        {
            steps{
              git url:'https://github.com/rajujaggu/spring-petclinic.git',
              git branch: "${params.branch-name}"
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