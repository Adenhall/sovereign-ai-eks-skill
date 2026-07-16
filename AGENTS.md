# sovereign-ai-eks

Build sovereign AI platforms on Amazon EKS from cloud to edge.

## Description

This skill provides comprehensive guidance for building self-contained AI platforms using Amazon EKS, open-source frameworks, and self-hosted model serving. It covers architecture patterns, model selection, GPU instance sizing, and deployment procedures for sovereign AI workloads with data residency requirements.

## Capabilities

- Provision EKS clusters with GPU node groups (G4/G5/G6/P4/P5/P6 instances)
- Deploy model serving engines (vLLM, TGI, Ollama, Triton)
- Configure AI gateways (LiteLLM, Kong)
- Set up vector databases (Qdrant, Milvus, pgvector, Weaviate)
- Deploy agent frameworks (LangGraph, CrewAI, AutoGen)
- Install observability stack (Prometheus, Grafana, OpenTelemetry)
- Configure storage (EBS, EFS, S3, Elastic Fabric Adapter)
- Set up CI/CD with ArgoCD
- Enable FinOps with Kubecost

## When to Use

Use this skill when the user asks to:
- Build a sovereign AI platform on EKS
- Deploy open-source LLMs on Kubernetes
- Set up AI serving from cloud to edge
- Choose GPU instances for model inference
- Build an AI platform with data residency requirements
- Deploy vLLM, TGI, or Ollama on EKS

## References

- `references/model-serving.md` - Model serving engine comparison and GPU instance selection
- `references/open-source-stack.md` - Open-source framework stack and architecture layers

## Resources

- AI on EKS Blueprint: https://awslabs.github.io/ai-on-eks
- Starter Kit: https://github.com/aws-samples/sample-genai-on-eks-starter-kit
- Workshop: https://catalog.workshops.aws/genaifsxeks
- VRAM Calculator: https://apxml.com/tools/vram-calculator
