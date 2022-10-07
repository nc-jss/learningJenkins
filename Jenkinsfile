pipeline {
    agent any

    parameters {
        // string(name: 'VERSION', defaultValue:'', description:'version to deploy on product')
        choice(name: 'VERSION' choices:['1','2','3'], description:'')
        booleanParam(name:'executeTests', defaultValue:true,description:'do you want to run tests')

    }

    environment {
        NEW_VERSION = 'this is just version envVar I have made'
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
            when{
                expression{
                    params.executeTests == true
                }
            }
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