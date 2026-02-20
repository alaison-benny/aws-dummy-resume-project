# Automated AWS Resume Project 🚀

An end-to-end DevOps project that hosts a professional resume as a static website on AWS S3, managed via Terraform (Infrastructure as Code) and deployed automatically through GitHub Actions (CI/CD).

## 🌐 Live Demo
You can view the live site here: [Insert Your S3 Website Link Here]

## 🏗️ Architecture
This project demonstrates a modern DevOps workflow:
1.  **Version Control:** Code hosted on GitHub.
2.  **Infrastructure as Code:** AWS resources (S3, Bucket Policies) defined in **Terraform**.
3.  **CI/CD Pipeline:** **GitHub Actions** automatically syncs the `index.html` to S3 upon every push.
4.  **Cloud Hosting:** **AWS S3** configured for static website hosting.



## 🛠️ Technologies Used
* **Cloud:** AWS (S3)
* **IaC:** Terraform
* **CI/CD:** GitHub Actions
* **CLI:** AWS CLI, Git Bash
* **Language:** HTML/CSS

## 🚀 Key Features
* **Automated Deployments:** No manual uploads. A simple `git push` updates the live website.
* **Managed Infrastructure:** Entire AWS setup is defined in `main.tf`, allowing for easy destruction or replication of the environment.
* **Security First:** Uses GitHub Secrets to store AWS credentials and `.gitignore` to protect sensitive Terraform state files.

## 🔧 How to Run Locally
1. **Clone the repo:**
   ```bash
   git clone [https://github.com/alaison-benny/aws-dummy-resume-project.git](https://github.com/alaison-benny/aws-dummy-resume-project.git)

## Initialize Terraform:

Bash
terraform init
## Plan the Infrastructure:

Bash
terraform plan
## Deploy:

Bash
terraform apply

Developed as part of my journey transitioning from Scrum Master to Cloud/DevOps Engineer.