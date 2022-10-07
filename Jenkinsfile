pipeline {
    agent any

    environment {
        NEW_VERSION = '1.3.0'
    }
    stages {
        stage('got to first stage'){
            steps{
                echo "first stage reached you can use sh \"cat <filepath>\"  to display contents of file"

                

                withCredentials([usernamePassword(credentialsId:'github-cred', usernameVariable: 'USER', passwordVariable: 'PWD' )]){
                   sh " echo \"${USER}:${PWD}\" "
                }
            }
        }


        stage('build') {
            steps{
            echo 'Building code'
            echo "version: ${NEW_VERSION}"
            }

        }
        stage('test') {
            steps{
            echo 'testing code'
            echo "version: ${NEW_VERSION}"
            }

        }
        stage('deploy') {
           steps {
            echo 'deploying code'
            echo "version: ${NEW_VERSION}"
            }

        }
    }
    post {
        always{
            echo 'goodbye'
        }
    }
}