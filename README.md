# DevOps Monitoring Pipeline

**Automated CI/CD for Python-based System Monitoring Dashboard on AWS EC2**

---

## Project Objective
- Build a **fully automated CI/CD pipeline** from GitHub to AWS EC2.  
- Automatically deploy Python monitoring dashboard on every code push.  
- Showcase **DevOps competencies**: IaC, CI/CD, containerization, cloud automation.

---

## Technologies
| Domain | Tech |
| --- | --- |
| CI/CD | GitHub Actions |
| Infrastructure | AWS (EC2, ECR, VPC, IAM, Security Group) |
| IaC | Terraform |
| Containerization | Docker |
| Application | Python (Flask, psutil, prometheus-client) |

---

## Architecture & Flow
1. **Developer Pushes Code** → `dev` branch.  
2. **CI Job (GitHub Actions)**  
   - Build Python app into **Docker image**.  
   - Push image to **AWS ECR**.  
3. **CD Job (GitHub Actions)**  
   - SSH into EC2.  
   - Pull latest Docker image.  
   - Stop & replace running container with new version.  

**Outcome:** Live application updated automatically within minutes after push.

---

## Key Skills Highlighted
- **Infrastructure as Code:** Terraform provisioning AWS EC2 + ECR.  
- **CI/CD Pipelines:** GitHub Actions for automated build & deployment.  
- **Cloud Deployment:** EC2 containerized app, IAM & Security best practices.  
- **Docker:** Containerized Python app for consistent deployments.  

---

## Screenshot
Dashboard running live on AWS EC2

<img width="1795" height="1036" alt="image" src="https://github.com/user-attachments/assets/9b75102e-9160-4e0d-9985-baea65639e11" />

CI/CD Pipeline

<img width="1795" height="1036" alt="image" src="https://github.com/user-attachments/assets/04fded5c-a345-4bb8-b76d-84ac4e84d594" />


