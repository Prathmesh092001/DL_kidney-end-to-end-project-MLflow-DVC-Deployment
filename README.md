# Kidney Disease Classification – MLflow + DVC

An end-to-end deep learning project for **Kidney Disease Classification** using **MLflow** for experiment tracking and **DVC** for pipeline orchestration.  
Includes **AWS CI/CD deployment with GitHub Actions**.

---

## 📂 Workflows

- Update `config.yaml`
- Update `secrets.yaml` *(Optional)*
- Update `params.yaml`
- Update the **entity**
- Update the **configuration manager** in `src/config`
- Update the **components**
- Update the **pipeline**
- Update `main.py`
- Update `dvc.yaml`
- `app.py` for endpoint local inference

---

## 🚀 How to Run

### 1️⃣ Clone the Repository
```bash
git clone https://github.com/Prathmesh092001/DL_kidney-end-to-end-project-MLflow-DVC-Deployment.git
cd DL_kidney-end-to-end-project-MLflow-DVC-Deployment


### 2️⃣ Create Conda Environment
```bash
conda create -n kidney python=3.11 -y
conda activate kidney
```

### 3️⃣ Install Requirements
```bash
pip install -r requirements.txt
```


### 4️⃣ Run the Application
```bash
python app.py
```
Now, open your **localhost** on the specified port.

---

## 5 MLflow Tracking

Run MLflow UI locally:
```bash
mlflow ui
```

Or connect with DagsHub:
```bash
export MLFLOW_TRACKING_URI=https://dagshub.com/Prathmesh092001/DL_kidney-end-to-end-project-MLflow-DVC-Deployment.mlflow
export MLFLOW_TRACKING_USERNAME=Prathmesh092001
export MLFLOW_TRACKING_PASSWORD=Your password
```

Run your experiment:
```bash
python script.py
```

## 🛠 DVC Commands

```bash
dvc init
dvc repro
dvc dag
```

---

## 📌 About MLflow & DVC

### **MLflow**
- Production-grade experiment tracking
- Logs & tags models
- Reproducible workflows

### **DVC**
- Lightweight for quick experiments
- Handles pipeline orchestration
- Data & model versioning

---


## ☁ AWS CI/CD Deployment (GitHub Actions)

### 1️⃣ AWS Setup
- **Login to AWS Console**
- **Create IAM User** with:
  - `AmazonEC2ContainerRegistryFullAccess`
  - `AmazonEC2FullAccess`

### 2️⃣ ECR Setup
- Create **ECR repo** to store docker images.
- Save the URI:
```bash
599373236292.dkr.ecr.us-north-1.amazonaws.com/kidney
```


### 3️⃣ EC2 Setup
- Create **EC2 Ubuntu Instance**
- Install Docker:
```bash
sudo apt-get update -y
sudo apt-get upgrade
curl -fsSL https://get.docker.com -o get-docker.sh
sudo sh get-docker.sh
sudo usermod -aG docker ubuntu
newgrp docker



### 4️⃣ GitHub Actions Runner
- Go to: **Settings → Actions → Runners → New self-hosted runner**
- Select OS, then run given commands.

### 5️⃣ GitHub Secrets
```env
AWS_ACCESS_KEY_ID=your_key
AWS_SECRET_ACCESS_KEY=your_secret
AWS_REGION=us-north-1
AWS_ECR_LOGIN_URI=599373236292.dkr.ecr.us-north-1.amazonaws.com
ECR_REPOSITORY_NAME=app
```

---


## 📦 Deployment Workflow
1. **Build Docker image** of the source code
2. **Push image to ECR**
3. **Launch EC2 instance**
4. **Pull image from ECR**
5. **Run container on EC2**

---
