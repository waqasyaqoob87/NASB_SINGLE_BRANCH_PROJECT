pipeline {
    agent any

    environment {
        DACPAC_PATH = "${WORKSPACE}\\bin\\Release\\SQL_SINGLE_BRANCH_PROJ.dacpac"
        GIT_REPO_URL = 'https://github.com/waqasyaqoob87/NASB_SINGLE_BRANCH_PROJECT.git' // Updated repository link
        MSBUILD_PATH = "\"${MSBuild}\""
        SQLPACKAGE_PATH = "\"${SQLPackage}\""
        SQL_SERVER_NAME = "SPMTNLAP006\\SQLEXPRESS"
    }

    stages {
        stage('Git Checkout') {
            steps {
                script {
                    checkout([$class: 'GitSCM', branches: [[name: '*/main']], userRemoteConfigs: [[url: GIT_REPO_URL]]])
                }
            }
        }

        stage('Build Dacpac from SQLProj') {
            steps {
                script {
                    bat "${MSBUILD_PATH} \"NASB_MULTI.sqlproj\" /p:Configuration=Release"
                }
            }
        }

        stage('Publish to UAT') {
            steps {
                script {
                    def sqlPackageCommand = "${SQLPACKAGE_PATH} /Action:Publish /SourceFile:\"${DACPAC_PATH}\" /TargetServerName:${SQL_SERVER_NAME} /TargetDatabaseName:NASB_S_UAT"
                    echo "Executing SQLPackage command for UAT: ${sqlPackageCommand}"
                    bat sqlPackageCommand
                }
            }
        }

        stage('Publish to PROD') {
            steps {
                script {
                    def sqlPackageCommand = "${SQLPACKAGE_PATH} /Action:Publish /SourceFile:\"${DACPAC_PATH}\" /TargetServerName:${SQL_SERVER_NAME} /TargetDatabaseName:NASB_S_PROD"
                    echo "Executing SQLPackage command for PROD: ${sqlPackageCommand}"
                    bat sqlPackageCommand
                }
            }
        }

        stage('Publish to DEV') {
            steps {
                script {
                    def sqlPackageCommand = "${SQLPACKAGE_PATH} /Action:Publish /SourceFile:\"${DACPAC_PATH}\" /TargetServerName:${SQL_SERVER_NAME} /TargetDatabaseName:NASB_S_DEV"
                    echo "Executing SQLPackage command for DEV: ${sqlPackageCommand}"
                    bat sqlPackageCommand
                }
            }
        }
    }
}
