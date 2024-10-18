pipeline {
    parameters {
        choice(
            name: 'ACTION',
            choices: ['apply', 'destroy'],
            description: 'Select the action you want to perform'
        )
    }
    agent any
    tools {
        terraform "terraform"
    }
    environment {
        BACKEND_ACCESS_KEY = credentials('BACKEND_ACCESS_KEY')
    }
    stages {
        stage('Checkout') {
            steps {
                script {
                    checkout scmGit(branches: [[name: '*/main']], extensions: [], userRemoteConfigs: [[credentialsId: 'GitHubcredentials', url: 'https://github.com/GosaliyaDeepCoder/InfraDeploy-Terraform_Jenkins_Terragrunt.git']])
                }
            }
        }
        stage('Azure login') {
            steps {
                withCredentials([azureServicePrincipal(credentialsId: 'Azurecredentials_SP',
                                                    subscriptionIdVariable: 'AZURE_SUBSCRIPTION_ID',
                                                    clientIdVariable: 'AZURE_CLIENT_ID',
                                                    clientSecretVariable: 'AZURE_CLIENT_SECRET',
                                                    tenantIdVariable: 'AZURE_TENANT_ID')]) {
                    sh " az login --service-principal -u ${env.AZURE_CLIENT_ID} -p ${env.AZURE_CLIENT_SECRET} --tenant ${env.AZURE_TENANT_ID} "   
                }
            }
        }

        /*stage('Azure login'){
            steps{
                withCredentials([azureServicePrincipal('Azurecredentials_SP')]) {
                    sh 'az login --service-principal -u ${AZURE_CLIENT_ID} -p ${AZURE_CLIENT_SECRET} -t ${AZURE_TENANT_ID}'
                }
            }
        }*/
        stage("Generate Documentation") {
            steps {
                script {
                    sh "terraform-docs markdown . --recursive --output-file README.md"
                    sh "rm -f README.md"
                    sh "git add ."
                    def changes = sh(script: 'git status --porcelain', returnStdout: true).trim()
                    if (changes) {
                        sh "git commit -m 'Add terraform documentation from Jenkins'"
                    }
                    def currentBranch = sh(script: 'git rev-parse --abbrev-ref HEAD', returnStdout: true).trim()
                    if (currentBranch != 'main') {
                            sh 'git checkout -B main'
                    }
                }
            }
        }
        stage("Push to Git Repository") {
            steps {
                withCredentials([gitUsernamePassword(credentialsId: 'GitHubcredentials', gitToolName: 'Default')]) {
                    sh "git push -u origin main"
                }
            }
        }
        stage('Tflint Testing') {
            steps {
                script {
                    /*
                    sh ' mkdir -p $HOME/.local/bin '
                    sh ' curl -s https://raw.githubusercontent.com/terraform-linters/tflint/master/install_linux.sh | bash '
                    sh ' sudo mv /tmp/tflint* /home/jenkins/.local/bin/tflint '
                    sh ' export PATH=$PATH:$HOME/.local/bin '
                    */
                    dir('modules') {
                        sh ' tflint --init --recursive'
                        sh ' tflint --module --recursive --force '
                    }
                }
            }    
        }
        stage('Tfsec Testing') {
            steps {
                script {
                    dir('modules') {
                        sh ' tfsec -s'
                    }
                }
            }    
        }
        stage('Dev Environment') {
            steps {
                script {
                    dir('Terragrunt_files/dev') {
                        sh 'terragrunt run-all  init'
                        sh "terragrunt run-all  ${params.ACTION} --terragrunt-non-interactive "
                    }
                }
            }    
        }
        stage('PreProd Environment') {
            steps {
                script {
                    dir('Terragrunt_files/preprod') {
                        sh 'terragrunt run-all  init'
                        sh "terragrunt run-all  ${params.ACTION} --terragrunt-non-interactive "
                    }
                }
            }    
        }
        stage('Prod Environment') {
            steps {
                script {
                    dir('Terragrunt_files/prod') {
                        sh 'terragrunt run-all  init'
                        sh "terragrunt run-all  ${params.ACTION} --terragrunt-non-interactive "
                    }
                }
            }    
        }
    }
    post {
        // Clean after build
        always {
            cleanWs(cleanWhenNotBuilt: false,
                    deleteDirs: true,
                    disableDeferredWipeout: true,
                    notFailBuild: true,
                    patterns: [[pattern: '**/*', type: 'INCLUDE']]
            )
        }
    }
}