// Sample Jenkinsfile using pGH, ssh and a zDT Agent (Nlopez)
// for help: https://www.jenkins.io/doc/book/pipeline/jenkinsfile/
 
// change these values to match your configuration
def myAgent  = 'zvsi'
def repo = 'git@github.com:nlopez1-ibm/poc-workspace.git'
def scriptsHome = '/u/ibmuser/waziDBB/dbb-v2/dbb-zappbuild/scripts'

def dbbbuild ='/u/nlopez/tmp/dbb-zappbuild/build.groovy'
def appworkspace = 'poc-workspace'
def appname = 'poc-app'

def ucdPublish =${scriptsHome}'/UCD/dbb-ucd-packaging.groovy' 
def buzTool  = '/u/ibmuser/ibm-ucd/agent/bin/buztool.sh'
def ucdComponent = 'poc-app'

// no changes required to this section 
pipeline {
    agent  { label myAgent } 
    options { skipDefaultCheckout(true) }
    
    stages {
        stage('Clone') {
            steps {
                println '** Cloning on USS ...'     
                script {
                    sh 'rm -rf *'
                    sh 'git clone ' + repo 
                    sh 'cd ' + appworkspace  + '; git log --graph --oneline --decorate -n 3'
                }
            }          
        }  

        stage('Build') {
            steps {
                println  '** Building one pgm with DBB ...'                  
                script {
                    sh 'groovyz ' + dbbbuild + ' -w ${WORKSPACE}/'+appworkspace  + ' -a ' + appname + ' -o ${WORKSPACE}/'+appworkspace + ' -h ' + env.USER + ' poc-app/cobol/datbatch.cbl'
                }
            }
        }

        stage('Publish') {
            steps {
                println  '** Package and Publish to UCDs CodeStation...'                  
                script {
                    sh 'groovyz ' + ucdPublish + ' --buztool ' + buzTool  + ' --workDir ${WORKSPACE}/'+appworkspace + ' --component ' + ucdComponent + ' --versionName ${BUILD_NUMBER}'
                }
            }
        }
    }    
}
