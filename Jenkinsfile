pipeline {
    agent any

    stages {
        stage('Checkout Code') {
            steps {
                git url: 'https://github.com/jcfeng011-sketch/cicd_pipeline_project.git',
                branch: 'master'
            }
        }

        stage('Build') {
            steps {
                sh 'chmod +x build.sh'
                sh './build.sh'
            }
        }

        stage('Test') {
            steps {
                sh 'chmod +x test.sh'
                sh './test.sh'
            }
        }
    }

    post {
        success {
            script {
                echo "Build succeeded!"
                withCredentials([string(credentialsId: 'NDRmZmQ2NTctNGRkZC00Y2UyLTgwNzYtMGNmZjk3YmZlYzA1Yjk4MTIwNWUtOTQy_P0A1_e58072af-9d57-4b13-abf7-eb3b506c964d', variable: 'WEBEX_TOKEN'),
                                 string(credentialsId: 'Y2lzY29zcGFyazovL3VybjpURUFNOnVzLXdlc3QtMl9yL1JPT00vY2YwODJmMTAtODBhMy0xMWYwLWEzMjAtODkzZTUzNWY3NGJm', variable: 'WEBEX_ROOM')]) {
                    sh '''
                    curl -X POST https://webexapis.com/v1/messages \
                    -H "Authorization: Bearer ${WEBEX_TOKEN}" \
                    -H "Content-Type: application/json" \
                    -d '{"roomId":"${WEBEX_ROOM}","text":"✅ Build #${BUILD_NUMBER} Success!"}'
                    '''
                }
            }
        }

        failure {
            script {
                echo "Build failed!"
                withCredentials([string(credentialsId: 'webex-auth-token', variable: 'WEBEX_TOKEN'),
                                 string(credentialsId: 'webex-room-id', variable: 'WEBEX_ROOM')]) {
                    sh '''
                    curl -X POST https://webexapis.com/v1/messages \
                    -H "Authorization: Bearer ${WEBEX_TOKEN}" \
                    -H "Content-Type: application/json" \
                    -d '{"roomId":"${WEBEX_ROOM}","text":"❌ Build #${BUILD_NUMBER} Failed!"}'
                    '''
                }
            }
        }
    }
}
