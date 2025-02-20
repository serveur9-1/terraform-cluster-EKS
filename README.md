# 🚀 Déploiement d'un Cluster EKS avec Terraform

## 📖 Description

Ce projet permet de déployer un cluster **Amazon EKS** en utilisant **Terraform**.  
L’infrastructure suit les **bonnes pratiques** : 
- **Modularisation** : un module `core-compute` pour le réseau et un module `eks` pour le cluster.
- **Backend S3** : pour stocker le `terraform.tfstate`.
- **DynamoDB** : pour le verrouillage de l'état Terraform.
- **Sécurité** : IAM, Security Groups et bonnes pratiques AWS.

## 📁 Architecture

📌 **Modules Terraform :**
- **`modules/core-compute`** : Gère le réseau (VPC, Subnets, Security Groups, NAT Gateway, EC2).
- **`eks/`** : Gère le cluster EKS et ses composants (Node Groups, Add-ons, IAM Role, ALB).

## 🛠️ Prérequis

Avant de commencer, assure-toi d'avoir installé :
- Terraform (`>=1.0.0`)
- AWS CLI (`>=2.0.0`)
- Un compte AWS avec les permissions nécessaires

## 🚀 Déploiement

1️⃣ **Initialiser Terraform**
```sh
terraform init
