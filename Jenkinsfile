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
        always {
            echo "========================================="
            echo "Build Pipeline Completed"
            echo "========================================="
            echo "Build Status: ${currentBuild.result}"
            echo "Build Number: ${BUILD_NUMBER}"
            echo "========================================="
        }

        success {
            echo "✅ Build #${BUILD_NUMBER} passed successfully!"
            sh """
            curl -X POST https://webexapis.com/v1/messages \
            -H "Authorization: Bearer NDRmZmQ2NTctNGRkZC00Y2UyLTgwNzYtMGNmZjk3YmZlYzA1Yjk4MTIwNWUtOTQy_P0A1_e58072af-9d57-4b13-abf7-eb3b506c964d" \
            -H "Content-Type: application/json" \
            -d '{"roomId":"Y2lzY29zcGFyazovL3VybjpURUFNOnVzLXdlc3QtMl9yL1JPT00vY2YwODJmMTAtODBhMy0xMWYwLWEzMjAtODkzZTUzNWY3NGJm","text":"✅ Build #${BUILD_NUMBER} Success!"}'
            """
        }

        failure {
            echo "❌ Build #${BUILD_NUMBER} failed!"
            sh """
            curl -X POST https://webexapis.com/v1/messages \
            -H "Authorization: Bearer NDRmZmQ2NTctNGRkZC00Y2UyLTgwNzYtMGNmZjk3YmZlYzA1Yjk4MTIwNWUtOTQy_P0A1_e58072af-9d57-4b13-abf7-eb3b506c964d" \
            -H "Content-Type: application/json" \
            -d '{"roomId":"Y2lzY29zcGFyazovL3VybjpURUFNOnVzLXdlc3QtMl9yL1JPT00vY2YwODJmMTAtODBhMy0xMWYwLWEzMjAtODkzZTUzNWY3NGJm","text":"❌ Build #${BUILD_NUMBER} Failed!"}'
            """
        }
    }
}
