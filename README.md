# sovereign-ai-eks-skill

Build sovereign AI platforms on Amazon EKS from cloud to edge.

This skill provides comprehensive guidance for building self-contained AI platforms using Amazon EKS, open-source frameworks, and self-hosted model serving. It covers architecture patterns, model selection, GPU instance sizing, and deployment procedures for sovereign AI workloads with data residency requirements.

## Compatibility

This skill follows the [Agent Skills Open Standard](https://github.com/anthropics/agent-skills) and is compatible with:

- **Kiro AI** - AWS's AI-powered IDE
- **OpenCode** - Open-source AI coding assistant
- **Hermes Agent** - Nous Research's AI agent framework
- **15+ other platforms** supporting the Agent Skills Open Standard

## Installation

### Automatic Installation

```bash
./install.sh
```

The installer auto-detects Kiro AI and OpenCode installations and copies the skill to the appropriate directory.

### Manual Installation

Copy the skill directory to your platform's skills folder:

**Kiro AI:**
```bash
cp -r . ~/.kiro/skills/sovereign-ai-eks/
```

**OpenCode:**
```bash
cp -r . ~/.opencode/skills/sovereign-ai-eks/
```

## Usage

Invoke the skill with:

```
/sovereign-ai-eks
```

Or ask questions like:
- "Build a sovereign AI platform on EKS"
- "Deploy open-source LLMs on Kubernetes"
- "Choose GPU instances for model inference"
- "Set up AI serving from cloud to edge"

## Contents

- **SKILL.md** - Main skill file with procedure and guidance
- **AGENTS.md** - Companion file for agent platforms
- **references/model-serving.md** - Model serving engine comparison and GPU selection
- **references/open-source-stack.md** - Open-source framework stack and architecture
- **install.sh** - Cross-platform installer

## Topics Covered

- EKS cluster provisioning with GPU nodes
- Model serving engines (vLLM, TGI, Ollama, Triton)
- GPU instance selection (G4/G5/G6/P4/P5/P6)
- AI gateways (LiteLLM, Kong)
- Vector databases (Qdrant, Milvus, pgvector)
- Agent frameworks (LangGraph, CrewAI, AutoGen)
- Observability (Prometheus, Grafana, OpenTelemetry)
- Storage configuration (EBS, EFS, S3, EFA)
- CI/CD with ArgoCD
- FinOps with Kubecost
- Sovereign AI vs Amazon Bedrock decision matrix

## License

MIT

## Author

James Ng + Hermes Agent
