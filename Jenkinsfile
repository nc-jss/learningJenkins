

pipeline {
    agent any

    parameters {
        // string(name: 'VERSION', defaultValue:'', description:'version to deploy on product')
        choice(name: 'VERSION', choices:['1','2','3'], description:'')
        booleanParam(name:'executeTests', defaultValue:true,description:'do you want to run tests')

    }

    environment {
        NEW_VERSION = 'this is just version envVar I have made'
    }
    stages {
        stage('got to first stage'){
            steps{
                echo "_______________________________________________________________________"
                echo "first stage reached you can use sh \"cat <filepath>\"  to display contents of file"

                withCredentials([usernamePassword(credentialsId:'github-cred', usernameVariable: 'USER', passwordVariable: 'PWD' )]){
                   sh " echo \"${USER}:${PWD}\" "
                }

                echo "trying to load a script"
                script{
                    def aGroovyscript = load "script.groovy"
                    echo "trying to execute a function"
                    aGroovyscript.myfunction()
                }
            }
        }


        stage('build') {
            steps{
            echo "_______________________________________________________________________"
            echo 'Building code'

            echo "version set in envVar: ${NEW_VERSION}"
            }

        }

        stage('test') {
            when{
                expression{
                    params.executeTests == true
                }
            }
            steps{
                echo "_______________________________________________________________________"
                echo 'params is set to excute test : testing code'
                echo "version is set in params to: ${param.VERSION}"
            }

        }
        stage('deploy') {
           steps {
            echo "_______________________________________________________________________"
            echo 'deploying code'
            echo "tested version:${param.VERSION}, builded version: ${NEW_VERSION}"
            }

        }
    }
    post {
        always{
            echo "_______________________________________________________________________"
            echo 'goodbye'
        }
    }
}