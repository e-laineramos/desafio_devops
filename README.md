# Static Website Infrastructure on AWS with Terraform
![Terraform](https://img.shields.io/badge/Terraform-v1%2B-623CE4?logo=terraform&logoColor=white)
![AWS](https://img.shields.io/badge/AWS-Deployed-orange?logo=amazon-aws&logoColor=white)
![Docker](https://img.shields.io/badge/Docker-Containerized-2496ED?logo=docker&logoColor=white)
![GitHub Actions](https://img.shields.io/badge/GitHub%20Actions-CI%2FCD-2088FF?logo=github-actions&logoColor=white)


This project automates the deployment of a static website on AWS using Docker containers, ECS Fargate, and Terraform, with CI/CD via GitHub Actions.

## 📑 Table of Contents
- [Architecture Overview](#architecture-overview)
- [Prerequisites](#prerequisites)
- [Setup Instructions](#setup-instructions)
- [Deployment Workflow](#deployment-workflow)
- [Accessing the Website](#accessing-the-website)
- [Cost Considerations](#cost-considerations)
- [Troubleshooting](#troubleshooting)
- [Cleanup](#cleanup)

## 🏗️ Architecture Overview

![Diagrama de Arquitetura AWS](assets\architecture.drawio.png)

**Components:**
- **Frontend**: Static website served from a Docker container
- **Infrastructure**:  
  - ECS Fargate (serverless containers)  
  - Application Load Balancer (ALB)  
  - VPC with public subnets in two Availability Zones  
  - CloudWatch for monitoring
- **CI/CD**: GitHub Actions pipeline

## ✅ Prerequisites

### Tools Required
- [Terraform](https://www.terraform.io/downloads.html) (≥ v1.0)
- [AWS CLI](https://aws.amazon.com/cli/) (v2)

### AWS Requirements
- AWS account with permissions to:
  - Create ECS, VPC, and ALB resources
  - Create IAM roles
- AWS CLI profile configured

### GitHub Requirements
- Repository secrets configured:
  - `AWS_ACCESS_KEY_ID`
  - `AWS_SECRET_ACCESS_KEY`

## ⚙️ Setup Instructions

### 1. Clone the repository
```bash
git clone https://github.com/your-repo/ascan-devops.git
cd ascan-devops/infra
```
### 2. Initialize Terraform
```bash
terraform init
```
### 3. Configure variables
Copy the example file and update with your values:
```bash
cp terraform.tfvars terraform.tfvars
```
Edit the file:
```bash
region       = "us-east-1"
docker_image = "your-dockerhub-username/your-image:tag"
```
### 4. Deploy infrastructure
```bash
terraform apply -auto-approve
```

## 🚀 Deployment Workflow
### CI/CD with GitHub Actions
- Triggered on push to main branch
- Authenticates with AWS using repository secrets
- Deploys to the existing ECS service

### Manual Deployment
- Update `docker_image` in `terraform.tfvars`
- Run:
```bash
terraform apply -auto-approve
```

## 🌐 Accessing the Website
After successful deployment, run:
```bash
terraform output website_url
```
Open the URL in your browser.

## 💰 Cost Considerations
This setup uses AWS Free Tier eligible resources:
- **ECS Fargate:** 750 hours/month with 0.25 vCPU
- **ALB:** 750 hours/month

> ⚠️ **Note:** ALB might incur minimal charges beyond Free Tier. Monitor your AWS billing dashboard regularly.

## 🛠️ Troubleshooting
### Website not reachable
- Check that the ALB DNS output is correct:
```bash
terraform output website_url
```
- Ensure ECS tasks are running
- Make sure security groups allow HTTP (port 80) traffic

### Deployment issues
- Review logs in GitHub Actions
- Confirm IAM roles and permissions
- Verify Docker image exists and is public

### Terraform errors
- Try:
```bash
terraform init -upgrade
```
- Double-check variable values and file paths

### 🧹 Cleanup
To destroy all created resources:
```bash
terraform destroy -auto-approve
```
> **⚠️ Warning: This will permanently delete all deployed infrastructure.**
