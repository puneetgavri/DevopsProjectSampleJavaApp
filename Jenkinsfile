pipeline {
    agent any

    stages {
        stage('code clone') {
            steps {
                echo 'Cloning code...'
                git 'https://github.com/puneetgavri/DevopsProjectSampleJavaApp.git'
            }
        }
         stage('Compile') {
            steps {
                echo 'Compileing the code...'
                sh '/opt/maven/bin/mvn compile'
            }
        }
        stage('SCA') {
            steps {
                echo 'SCA...'
                sh '/opt/maven/bin/mvn -P metrics pmd:pmd'
            }
            post {
               success {
				   recordIssues sourceCodeRetention: 'LAST_BUILD', tools: [pmdParser(pattern: '**/target/pmd.xml')]
		  // recordIssues enabledForFailure: true, tool: pmdParser(pattern: '**/target/pmd.xml')
               }
           }	
        }
        stage('test') {
            steps {
                echo 'unit testing...'
                sh '/opt/maven/bin/mvn test'
            }
            post {
               success {
                   junit 'target/surefire-reports/*.xml'
               }
           }	
        }
        stage('codecoverage') {
	   steps {
                echo 'unittest..'
	        sh script: '/opt/maven/bin/mvn verify'
                 }
	   post {
               success {
                   jacoco buildOverBuild: true, deltaBranchCoverage: '20', deltaClassCoverage: '20', deltaComplexityCoverage: '20', deltaInstructionCoverage: '20', deltaLineCoverage: '20', deltaMethodCoverage: '20'
               }
           }			
        }
        stage('package') {
            steps {
                echo 'Creatig package...'
                sh '/opt/maven/bin/mvn package'
            }
        }
    }
}
