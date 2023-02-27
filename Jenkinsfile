// Sample Jenkinsfile using pGH, ssh and a zDT Agent (Nlopez)
// for help: https://www.jenkins.io/doc/book/pipeline/jenkinsfile/
 
// change these values to match your configuration
// sample scripts are @ '/u/ibmuser/waziDBB/dbb-v2/dbb-zappbuild/scripts'

def myAgent  = 'zvsi'
def repo = 'git@github.com:nlopez1-ibm/poc-workspace.git'

def dbbbuild ='/u/ibmuser/waziDBB/dbb-v2/dbb-zappbuild/build.groovy'
def appworkspace = 'poc-workspace'
def appname = 'poc-app'

def ucdPublish = '/u/ibmuser/waziDBB/dbb-v2/dbb-zappbuild/scripts/UCD/dbb-ucd-packaging.groovy' 
def buzTool  = '/u/ibmuser/ibm-ucd/agent/bin/buztool.sh'
def ucdComponent = 'poc-component'

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
                println  '** Building with DBB in Impact Mode ...'                  
                script {

                    // example to build one program for quick testing ( not supported by UCD)
                    // sh 'groovyz ' + dbbbuild + ' -w ${WORKSPACE}/'+appworkspace  + ' -a ' + appname + ' -o ${WORKSPACE}/'+appworkspace + ' -h ' + env.USER+'.JENKINS' + ' poc-app/cobol/datbatch.cbl'
                    
                    // do a scnonly for first time build 
                    // sh 'groovyz ' + dbbbuild + ' -w ${WORKSPACE}/'+appworkspace  + ' -a ' + appname + ' -o ${WORKSPACE}/'+appworkspace + ' -h ' + env.USER+'.JENKINS' + ' --fullBuild --scanOnly'
                    
                    
                    // Normal runMode 
                    sh 'groovyz ' + dbbbuild + ' -w ${WORKSPACE}/'+appworkspace  + ' -a ' + appname + ' -o ${WORKSPACE}/'+appworkspace + ' -h ' + env.USER+'.JENKINS' + ' --impactBuild'
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
