---
name: sovereign-ai-eks
description: Build sovereign AI platforms on Amazon EKS from cloud to edge
version: 0.1.0
author: James Ng + Hermes Agent
license: MIT
tags: [AWS, EKS, Sovereign-AI, Kubernetes, Open-Source, Edge, GPU, Model-Serving]
---

# /sovereign-ai-eks

Build self-contained AI platforms from cloud to edge using Amazon EKS, open-source frameworks, and self-hosted model serving. Covers architecture, model selection, GPU instance sizing, and deployment.

## When to Use

- "Build a sovereign AI platform on EKS"
- "Deploy open-source LLMs on Kubernetes"
- "Set up AI serving from cloud to edge"
- "Choose GPU instances for model inference"
- "Build an AI platform with data residency requirements"
- "Deploy vLLM / TGI / Ollama on EKS"

## Prerequisites

- AWS account with EKS permissions
- `kubectl` and `helm` installed
- Docker for container builds
- Understanding of Kubernetes concepts (deployments, services, HPAs)
- For GPU nodes: NVIDIA device plugin for EKS

## Quick Reference

```
# Starter kit
https://github.com/aws-samples/sample-genai-on-eks-starter-kit

# Workshop
https://catalog.workshops.aws/genaifsxeks

# Blueprint
https://awslabs.github.io/ai-on-eks

# VRAM calculator (right-size GPU)
https://apxml.com/tools/vram-calculator
```

## Procedure

### 1. Provision EKS Cluster

```bash
# Create cluster with GPU node group
eksctl create cluster --name sovereign-ai --version 1.31 \
  --nodegroup-name gpu-nodes --node-type g5.12xlarge \
  --nodes 2 --nodes-min 1 --nodes-max 4 \
  --with-oidc --ssh-access --ssh-public-key your-key
```

### 2. Install Model Serving

See `references/model-serving.md` for engine comparison:

```bash
# vLLM (recommended for throughput)
helm install vllm ./vllm-helm-chart \
  --set model.name=meta-llama/Llama-3.1-70B \
  --set gpu.count=4

# Ollama (recommended for simplicity)
helm install ollama ./ollama-helm-chart
```

### 3. Deploy AI Gateway

```bash
# LiteLLM for routing/rate limiting
helm install litellm ./litellm-helm-chart \
  --set config.models[0].model=vllm/llama-3.1-70b
```

### 4. Set Up Vector Database

See `references/open-source-stack.md`:

```bash
# Qdrant
helm install qdrant qdrant/qdrant

# Or Milvus
helm install milvus milvus/milvus
```

### 5. Deploy Agent Framework

```bash
# LangGraph as a service
kubectl apply -f langgraph-deployment.yaml
```

### 6. Install Observability

```bash
# Prometheus + Grafana + OpenTelemetry
helm install kube-prometheus-stack prometheus-community/kube-prometheus-stack
helm install opentelemetry-collector open-telemetry/opentelemetry-collector
```

### 7. Configure Storage

- **EBS**: For model weights (fast SSD)
- **EFS**: For shared data across pods
- **S3**: For datasets and model artifacts
- **Elastic Fabric Adapter**: For high-bandwidth ML training

### 8. Set Up CI/CD

```bash
# ArgoCD for GitOps
helm install argocd argo/argo-cd
```

### 9. Enable FinOps

```bash
# Kubecost for GPU cost tracking
helm install kubecost cost-analyzer/cost-analyzer
```

### 10. Add Developer Portal

- Jupyter Hub for notebooks
- Open WebUI for chat interface

## Pitfalls

- **GPU shortage**: G5/P4 instances can have limited availability. Reserve or use Spot with checkpointing.
- **VRAM sizing**: Use https://apxml.com/tools/vram-calculator to right-size. 70B model needs ~140GB VRAM (2x A100 80GB or 4x L40S 48GB).
- **EKS Hybrid Nodes networking**: Ensure on-prem nodes can reach EKS control plane via VPN/Direct Connect.
- **Model download time**: Large models (70B+) take 20+ minutes to download. Pre-pull to EBS snapshots.
- **Inferentia vs GPU**: Inferentia2 is cheaper for inference but doesn't support all model architectures. Test compatibility first.
- **Open WebUI memory limits**: Set resource limits - Open WebUI can consume significant RAM with many concurrent users.

## Verification

```bash
# Verify EKS cluster
kubectl get nodes -o wide

# Verify model serving endpoint
kubectl get svc vllm-service
curl http://vllm-service:8000/health

# Verify GPU allocation
kubectl describe nodes | grep -A5 "Allocated resources"
```
