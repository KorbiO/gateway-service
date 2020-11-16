pipeline {
	agent any
	tools {
    maven 'maven-3'
    jdk 'java'
  }
  
	stages {
		stage('SCM Checkout'){
			steps{
        	git credentialsId: 'gitPwd', url: 'https://github.com/KorbiO/gateway-service'
        		}
    }
		stage('Compile') {
			steps {
			withMaven(maven : 'maven-3'){
				
				bat './mvnw clean compile'
				bat './mvnw package -DskipTests'
				
			}	
				  }
		}
		stage('Build Docker Image'){
			steps{
        		bat 'docker build -t omarkorbi/gateway-service:latest .'
        		}
    }
    stage('Push Docker Image'){
     	steps{
	        bat 'docker login -u omarkorbi -p gotktpas123'
	  		bat 'docker tag gateway-service:latest omarkorbi/gateway-service '
	  		bat 'docker push omarkorbi/gateway-service'
	  		}
    }
     stage('Run Kubernetes'){
    	steps{
    	
   	   		bat 'kubectl --kubeconfig ./config apply -f deployment.yaml'
   	   		}
    }
     
    
		
	}
}