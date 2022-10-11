

pipeline {
    agent {
        docker{
            image "alpine"
            args "-v tmp:/tmp"
        }
    }

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
                echo "version is set in params to: ${params.VERSION}"
            }

        }
        stage('deploy') {
            options {
                timeout(time:2,unit:"MINUTES")
            }

           steps {
            echo "_______________________________________________________________________"
            echo 'deploying code'
            echo "tested version:${params.VERSION}, builded version: ${NEW_VERSION}"
            }

        }
    }
    post {
        always{
            echo "_______________________________________________________________________"
            echo 'goodbye'
            // cleanWs()
        }
    }
}

//jenkinspipelineunit
//test and mock the pipeline 
//mocking sh
//execute pipeline in jenkinsShell


//Jenkins unit test Harness
//integration testing

//Jenkinsfile runner
//execute pipeline in cmd prompt at a function
//has a dockerimage: docker run --rm -v $(pwd)/jenkinsfile:/workspace/jenkinsfile jenkins/jenkinsfile-runner

//Read jenkins.io/doc/book/pipeline/pipeline-best-practice
//all code is run on jenkins master

