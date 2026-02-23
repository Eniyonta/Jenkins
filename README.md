# Jenkins CI/CD Proof of Concept (POC)

## Project Overview

This project demonstrates a **full CI/CD pipeline using Jenkins**.  
It consists of two parts:

- **Part 1:** Traditional Jenkins deployment on EC2  
- **Part 2:** Serverless Jenkins deployment on AWS Fargate  

The goal is to validate Jenkins as a CI/CD tool, integrate it with GitHub, and explore modern **serverless CI/CD architecture**.

---

## 🔹 Part 1 – Jenkins POC on EC2

### Overview

- Jenkins 2 deployed on an EC2 instance  
- Connected to a **GitHub repository** for version control  
- Pipeline implemented with **four stages**:
  1. Checkout
  2. Build
  3. Test
  4. Deploy  

### Pipeline Highlights

- Declarative pipeline using a Jenkinsfile in GitHub  
- GitHub integration allows automatic checkout and pipeline triggering  
- Build, test, and deploy steps are simulated using `echo` commands  
- Pipeline as Code enables version-controlled automation

### Key Findings

- Jenkins requires **persistent storage** for jobs and plugins  
- Plugins are essential for functionality and integration  
- Pipeline as Code simplifies updates and version control  
- EC2-based Jenkins works well for POC but requires **manual maintenance**  

### Screenshots

- Jenkins Dashboard with pipeline configured  
- Pipeline execution showing stages running successfully  
- Build success confirmation  
- GitHub integration verified  

---

## 🔹 Part 2 – Serverless Jenkins on AWS Fargate

### Overview

- Jenkins deployed **serverlessly** using AWS ECS Fargate  
- Dynamic agents created automatically for each pipeline run  
- Jenkins master persists data in **EFS**  
- Access through **Application Load Balancer (ALB)**  
- CloudWatch used for logging all builds and agents

### Architecture Highlights

- Jenkins master container runs on Fargate  
- Build agents spin up dynamically on demand  
- Agents auto-terminate after pipeline completion  
- Fully managed, scalable, and **no server maintenance required**  

### Pipeline Highlights

- Pipeline executed on **Fargate agents**  
- Same stages: Checkout → Build → Test → Deploy  
- Logs collected in CloudWatch for monitoring and troubleshooting

### Key Findings

- Serverless Jenkins eliminates server management overhead  
- Auto-scaling agents reduce cost and improve efficiency  
- EFS ensures persistent Jenkins data even when containers terminate  
- Initial setup is more complex but provides a **modern, scalable CI/CD architecture**

### Screenshots

- Architecture diagram showing ECS cluster, Fargate agents, and EFS  
- Pipeline execution showing dynamic agent creation and termination  
- CloudWatch logs for pipeline builds  

---

## 🔹 GitHub Repository

- Repository Name: **Jenkins**  
- Contains:
  - `README.md` (this file)  
  - `Jenkinsfile` for pipeline  
  - Screenshots folder  
- Collaborator: ClintonChe (reviewer assigned)
