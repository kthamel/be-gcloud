# Devoteam G Cloud task
## Provisioning and Deploying 
### Provision to GCP
[There is Jenkins pipeline file, called "jenkinsfile-infra" located inside the "gcloud-pipelines" directory]
[There using declarative jenkins pipeline with Terraform to provision the infrastructure]
### Deploy to GKE
[There is Jenkins pipeline file, called "jenkinsfile-k8s" located inside the "gcloud-pipelines" directory]
[There using declarative jenkins pipeline with basic Bash commands to deploy the "microservices-demo" multi-tier microservices application]
### Jenkins VM
[Also, using the standanle Jenkins VM, to run those pipelines]
[Not inside the VPC, that mentioned in the task]
[Only accessible from MY IP address] || << It's /32 
[That VM is configured using the blow]

[
#!/bin/bash
curl -Lo skaffold https://storage.googleapis.com/skaffold/releases/latest/skaffold-linux-amd64
sudo install skaffold /usr/local/bin/
sudo wget -O /usr/share/keyrings/jenkins-keyring.asc \
  https://pkg.jenkins.io/debian-stable/jenkins.io-2023.key
echo "deb [signed-by=/usr/share/keyrings/jenkins-keyring.asc]" \
  https://pkg.jenkins.io/debian-stable binary/ | sudo tee \
  /etc/apt/sources.list.d/jenkins.list > /dev/null
sudo apt-get update
sudo apt-get install jenkins
sudo apt update
sudo apt install fontconfig openjdk-17-jre -y
java -version
sudo systemctl enable jenkins
sudo systemctl start jenkins
sudo apt-get update && sudo apt-get install -y gnupg software-properties-common
wget -O- https://apt.releases.hashicorp.com/gpg | gpg --dearmor | sudo tee /usr/share/keyrings/hashicorp-archive-keyring.gpg > /dev/null
gpg --no-default-keyring --keyring /usr/share/keyrings/hashicorp-archive-keyring.gpg --fingerprint
echo "deb [signed-by=/usr/share/keyrings/hashicorp-archive-keyring.gpg] \
https://apt.releases.hashicorp.com $(lsb_release -cs) main" | sudo tee /etc/apt/sources.list.d/hashicorp.list
sudo apt update
sudo apt-get install terraform -y
curl -fsSL https://get.docker.com -o get-docker.sh
sudo sh ./get-docker.sh --dry-run
sudo sh ./get-docker.sh 
sudo systemctl enable docker.service
sudo systemctl start docker.service
sudo usermod -aG docker jenkins
curl -LO "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl"
curl -LO "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl.sha256"
sudo install -o root -g root -m 0755 kubectl /usr/local/bin/kubectl
sudo apt-get install google-cloud-sdk-gke-gcloud-auth-plugin
gke-gcloud-auth-plugin --version
///
]