# Gradyent EKS Deployment

## Overview
This repo provisions an AWS EKS cluster using Terraform and deploys a sample application (`gradyent/sample-app:latest`) via Helm. The setup ensures scalability, monitoring, cost optimization, and production-readiness.

## Features
-  EKS cluster via Terraform (modular)
-  VPC, NAT Gateway, Public Subnets
-  Helm chart deployment
-  Readiness and Liveness probes
-  Horizontal Pod Autoscaler
-  GitLab CI/CD pipeline
-  Ingress setup
-  Cost-optimized and scalable


## Security Best Practices
- AWS IAM Role for Service Accounts (IRSA) is enabled
- Cluster is private with public load balancer only
- Secrets and tokens are not stored in repo

## Monitoring (Optional Add-ons)
Install Prometheus and Grafana:
```bash
helm repo add prometheus-community https://prometheus-community.github.io/helm-charts
helm repo add grafana https://grafana.github.io/helm-charts
helm install prom prometheus-community/kube-prometheus-stack
helm install graf grafana/grafana
```

## Deployment
```bash
git clone https://gitlab.com/your-repo/eks-gradyent.git
cd eks-gradyent
terraform init && terraform apply -auto-approve
helm upgrade --install gradyent-app ./helm-chart
```

## GitLab CI/CD Setup
Configure your GitLab project’s variables:
- `AWS_ACCESS_KEY_ID`
- `AWS_SECRET_ACCESS_KEY`
- `KUBECONFIG_CONTENT` (Base64 kubeconfig)

Then commit to trigger the pipeline.



## Cleanup
This step is not advisable to perform in real-case project.
```bash
terraform destroy -auto-approve
```