# Open-Source Framework Stack for Sovereign AI on EKS

## Architecture Layers

```
+------------------------------------------------------+
|                  AI Platform Core                     |
|  +----------+ +----------+ +----------------------+  |
|  | Model    | | AI       | | Data Pipeline &       | |
|  | Training | | Gateway  | | Orchestration         | |
|  | & Tuning | | & Mono.  | |                       | |
|  | (MLOps)  | |          | | MCP Servers           | |
|  +----------+ +----------+ +----------------------+  | |
|  +----------+ +----------+ +----------------------+  | |
|  | Model    | | AI Ethics| | Model Monitoring      | |
|  | Registry | | & Gov.   | | & Evaluation         | |
|  +----------+ +----------+ +----------------------+  | |
+------------------------------------------------------+
|              Platform Engineering Core                |
|  Infrastructure - Automation - Config Mgmt - CI/CD   |
|  Observability - Security & Compliance - FinOps      |
|  Developer Self-Service Portal - Service Mesh        |
+------------------------------------------------------+
|                    Compute Layer                      |
|  Amazon EKS - EKS Hybrid Nodes                        |
|  NVIDIA GPUs - Inferentia - Trainium - CPUs           |
+------------------------------------------------------+
|                    Storage Layer                      |
|  Elastic Fabric Adapter - EBS - FSx - EFS - S3        |
+------------------------------------------------------+
|                  Enterprise Data Platform             |
|  Vector DBs - Data Sources - Amazon Bedrock           |
+------------------------------------------------------+
        Cloud          On-Premises          Edge
```

## Open-Source Options by Layer

| Layer | Open-Source Options |
|---|---|
| **UI Frameworks** | Open WebUI, Gradio, Streamlit |
| **AI Gateways** | LiteLLM, Kong AI Gateway, custom |
| **Model Serving Engines** | vLLM, TGI, Ollama, Triton Inference Server |
| **Agents** | LangGraph, CrewAI, Strands SDK, AutoGen |
| **Vector DB / Data** | Qdrant, Weaviate, Milvus, pgvector, ChromaDB |
| **Observability** | Prometheus, Grafana, OpenTelemetry, Phoenix |

## EKS Hybrid Nodes

Run EKS workloads across cloud, on-premises, and edge:
- Cloud EKS cluster manages everything
- Hybrid nodes extend to on-prem GPU servers
- Same Kubernetes API everywhere
- Data stays where it needs to (sovereignty)

## Sovereign AI vs Bedrock Decision Matrix

| Factor | Sovereign AI (EKS) | Amazon Bedrock |
|---|---|---|
| Data residency | Full control, on-prem | AWS regions, CRIS for APAC |
| Model choice | Any open-source model | Curated list (Claude, Nova, Llama, etc.) |
| Cost model | Self-managed (GPU hourly) | Per-token usage |
| Customization | Full fine-tuning, custom weights | Limited fine-tuning, Custom Model Import |
| Latency | Edge deployment possible | Region-bound |
| Compliance | You control everything | AWS compliance postures |
| Team expertise | High (K8s, MLOps) | Low (managed service) |
| Time to production | Weeks to months | Days to weeks |
