pipeline {
    agent any
    tools {
       terraform 'terraform'
    }
    stages {
        stage('Git checkout') {
           steps{
                git branch: 'main', credentialsId: 'jking-pkey', url: 'https://github.com/raviga006/Az-jenk.git'
            }
        }
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
                sh 'terraform fmt'
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
                ), string(credentialsId: 'access_key', variable: 'ARM_ACCESS_KEY')])
                sh 'terraform init -backend-config="access_key=$ARM_ACCESS_KEY"'
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
                ), string(credentialsId: 'access_key', variable: 'ARM_ACCESS_KEY')])
                sh 'terraform apply --auto-approve -backend-config="access_key=$ARM_ACCESS_KEY"'
            }
            }
        }
    }

    
}
