# CI/CD Pipeline for Cloud Deployment

This project demonstrates a basic CI/CD pipeline for deploying a Dockerized web application to an AWS EC2 instance.

The goal is to automate the deployment process using GitHub Actions, Docker, and AWS EC2.

---

## Overview

The pipeline works as follows:

1. Code is pushed to the `main` branch
2. GitHub Actions starts automatically
3. Project files are copied to an AWS EC2 instance
4. Docker image is built on the EC2 instance
5. Old container is stopped and removed
6. New container is started
7. Application becomes available through the EC2 public IP

---

## Technologies Used

- AWS EC2
- GitHub Actions
- Docker
- Linux
- SSH
- Nginx

---

## Architecture

```text
Developer
   |
   | git push
   v
GitHub Repository
   |
   | GitHub Actions
   v
AWS EC2 Instance
   |
   | Docker build & run
   v
Nginx Web Application
```

## Deployment Workflow

### The GitHub Actions workflow:

* checks out the repository

* copies project files to the EC2 instance using SSH

* runs the deployment script on the server

* builds and starts the Docker container

## GitHub Secrets

The following repository secrets are required:
```
EC2_HOST 
EC2_USER
EC2_SSH_KEY
```
## Local Docker Test

Build the image locally:
```
docker build -t aws-cicd-demo . 
```
Run the container:

```
docker run -d -p 8080:80 --name aws-cicd-demo-container aws-cicd-demo
```
Open:
```
http://localhost:8080
```
Stop and remove the container:

```
docker stop aws-cicd-demo-container
docker rm aws-cicd-demo-container
```
## Deployment Test

After pushing changes to GitHub, the workflow runs automatically.

The deployed application can be accessed at:

```
http://<EC2_PUBLIC_IP>
```
## What I Learned

* Building and running Docker containers

* Creating a GitHub Actions deployment workflow

* Deploying applications to AWS EC2

* Using SSH-based deployment automation

* Automating repeatable deployment steps

* Basic troubleshooting of CI/CD and server deployment issues

## Future Improvements
* Push Docker images to Amazon ECR

* Deploy containers using Amazon ECS

* Add rollback mechanism

* Add monitoring with CloudWatch

* Use Terraform to provision the EC2 instance

* Restrict SSH access for better security
