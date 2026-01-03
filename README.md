DevOps CI/CD Pipeline with Jenkins, Docker & Prometheus
📌 Project Overview

This project demonstrates a complete CI/CD pipeline using GitHub, Jenkins, Docker, and Prometheus on AWS EC2.
The pipeline automatically builds, pushes, and deploys Docker images based on branch strategy (dev → prod) and includes basic monitoring.

🏗️ Architecture

EC2 (Amazon Linux) – Jenkins, Docker, Application, Monitoring

GitHub – Source code & branching

Jenkins (Multibranch Pipeline) – CI/CD automation

Docker Hub

amritapl/dev → Development image (public)

amritapl/prod → Production image (private)

Prometheus + Node Exporter – Health monitoring

🌿 Git Branch Strategy
Branch	Purpose
dev	Development & testing
master	Production

Rule:
When dev is merged into master, a production Docker image is built and pushed.

⚙️ CI/CD Flow (Jenkins)
DEV Pipeline

Trigger: Push to dev

Actions:

Build Docker image

Tag as amritapl/dev:latest

Push to Docker Hub (dev repo)

Deploy container on EC2

PROD Pipeline

Trigger: Merge dev → master

Actions:

Build Docker image

Tag as amritapl/prod:latest

Push to Docker Hub (prod repo)

Deploy production container

📂 Repository Structure
.
├── Dockerfile
├── Jenkinsfile
├── build.sh
├── deploy.sh
├── .gitignore
├── .dockerignore
├── build/            # React build output

🐳 Docker Automation

build.sh

Builds image based on environment (dev or prod)

Pushes image to Docker Hub

deploy.sh

Pulls latest image

Stops old container

Runs updated container on EC2

📊 Monitoring (Prometheus)

Prometheus running in Docker (:9090)

Node Exporter running in Docker (:9100)

Monitors:

EC2 health

CPU, memory, disk

Target status verified from Prometheus → Status → Targets

✅ Validation Checklist

✔ Jenkins Multibranch Pipeline detects dev & master

✔ DEV image pushed to amritapl/dev

✔ PROD image pushed to amritapl/prod

✔ Application accessible via EC2 public IP

✔ Prometheus targets visible and scraping

🏁 Conclusion

This project fulfills all CI/CD and monitoring requirements:

Automated build & deployment

Branch-based environment control

Dockerized application

Health monitoring using open-source tools
