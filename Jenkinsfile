pipeline {
    agent any
    tools {
       terraform 'terraform'
    }
    stages {
        stage('terraform format check') {
            steps{
                 ansiColor('xterm') {
                    withCredentials([azureServicePrincipal(
                    credentialsId: 'Jenkins',
                    subscriptionIdVariable: 'ARM_SUBSCRIPTION_ID',
                    clientIdVariable: 'ARM_CLIENT_ID',
                    clientSecretVariable: 'ARM_CLIENT_SECRET',
                    tenantIdVariable: 'ARM_TENANT_ID'
                ), string(credentialsId: 'access_key', variable: 'ARM_ACCESS_KEY')])
                       sh """
                        echo "Initialising Terraform"
                       terraform fmt -backend-config="access_key=$ARM_ACCESS_KEY" -backend-config="storage_account_name=$BACKEND_STORAGE_ACCOUNT_NAME" -backend-config="container_name=$BACKEND_STORAGE_ACCOUNT_CONTAINER_NAME" -backend-config="key=$BACKEND_KEY" -backend-config="resource_group_name=$RG_NAME"
                        """
                        
                }
            }
            }
        }
        stage('terraform Init') {
            steps{
                ansiColor('xterm') {
                    withCredentials([azureServicePrincipal(
                    credentialsId: 'Jenkins',
                    subscriptionIdVariable: 'ARM_SUBSCRIPTION_ID',
                    clientIdVariable: 'ARM_CLIENT_ID',
                    clientSecretVariable: 'ARM_CLIENT_SECRET',
                    tenantIdVariable: 'ARM_TENANT_ID'
                ), string(credentialsId: 'access_key', variable: 'ARM_ACCESS_KEY')]){
                     sh """
                        echo "Initialising Terraform"
                        terraform init -backend-config="access_key=$ARM_ACCESS_KEY" -backend-config="storage_account_name=$BACKEND_STORAGE_ACCOUNT_NAME" -backend-config="container_name=$BACKEND_STORAGE_ACCOUNT_CONTAINER_NAME" -backend-config="key=$BACKEND_KEY" -backend-config="resource_group_name=$RG_NAME"
                        """
                    }
                }
            }
        }
        stage('terraform apply') {
            steps{
                 ansiColor('xterm') {
                    withCredentials([azureServicePrincipal(
                    credentialsId: 'Jenkins',
                    subscriptionIdVariable: 'ARM_SUBSCRIPTION_ID',
                    clientIdVariable: 'ARM_CLIENT_ID',
                    clientSecretVariable: 'ARM_CLIENT_SECRET',
                    tenantIdVariable: 'ARM_TENANT_ID'
                ), string(credentialsId: 'access_key', variable: 'ARM_ACCESS_KEY')]) {
                    sh 'terraform apply --auto-approve -backend-config="access_key=$ARM_ACCESS_KEY"'
                }
            }
            }
        }
    }

    
}
