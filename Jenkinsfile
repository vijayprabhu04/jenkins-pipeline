pipeline {
	agent any
		stages {

			stage("Generic Inputs") {
				input {
					message "Select what task you want to perform ?"
					parameters {
						booleanParam(defaultValue: 'false', description: 'Create', name: 'create')
						booleanParam(defaultValue: 'false', description: 'Destroy', name: 'destroy')
						}
					}
					steps {
					script {	
						env_create = "${create}"
						env_destroy = "${destroy}"
						}
					}
				}


			stage("Terraform-create") {
				steps {
					script {
						if (env_create == 'true') {
						sh '''
						echo "Creating instance"
						cd ${WORKSPACE}/terraform/ && terraform init && terraform apply -auto-approve -lock=false
						'''
						}
					}
				}
			}

			stage("Terraform-destroy") {
				steps {
					script {
						if (env_destroy == 'true') {
						sh '''
						echo "Destroy instance"
						cd ${WORKSPACE}/terraform/ && terraform init && terraform destroy -auto-approve -lock=false
						'''
						}
					}
				}
			}
		}
	}
