pipeline{
    agent {label 'MAVEN-BUILD'}
     parameters {
        choice(name: 'branch', choices: ['main', 'wavefront'], description: 'branch name')
     }
   
    stages {
        stage ('vcs')
        {
            steps{
              git url: 'https://github.com/rajujaggu/spring-petclinic.git',
                  branch: "${params.branch}"
            }
        }
          
}

}