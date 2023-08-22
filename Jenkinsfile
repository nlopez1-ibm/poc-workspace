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

                    // example to build one program for quick testing is now supported by UCD (skip impact for now)
                    //sh 'groovyz ' + dbbbuild + ' -w ${WORKSPACE}/'+appworkspace  + ' -a ' + appname + ' -o ${WORKSPACE}/'+appworkspace + ' -h ' + env.USER+'.JENKINS' + ' poc-app/cobol/datbatch.cbl'
                    
                    // scan  must do a scan on a first run
                    sh 'groovyz ' + dbbbuild + ' -w ${WORKSPACE}/'+appworkspace  + ' -a ' + appname + ' -o ${WORKSPACE}/'+appworkspace + ' -h ' + env.USER+'.JENKINS' + ' --fullBuild --scanOnly'
                    
                    
                    // Normal impact Mode  (dbb toolkit build 88+)
                    sh 'groovyz ' + dbbbuild + ' -w ${WORKSPACE}/'+appworkspace  + ' -a ' + appname + ' -o ${WORKSPACE}/'+appworkspace + ' -l UTF-8   -h ' + env.USER+'.JENKINS' + ' --impactBuild'

                    // save the build logs in utf-8 -l above 
                    archiveArtifacts artifacts: '**/*.log', fingerprint: false
                }
            }
        }

        stage('Stage for Deploy') {
            steps {
                println  '** Package and Publish to UCDs CodeStation...'                  
                script {
                    sh 'groovyz ' + ucdPublish + ' --buztool ' + buzTool  + ' --workDir ${WORKSPACE}/'+appworkspace + ' --component ' + ucdComponent + ' --versionName ${BUILD_NUMBER}'
                }
            }
        }        
    }   
    
    post {
            always {
                echo 'Saving Logs ...'
                archiveArtifacts artifacts: '**/*.log', fingerprint: false                
                }
    }        
}
