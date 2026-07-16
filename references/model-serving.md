# Model Serving Engines & GPU Instance Selection

## Model Serving Engine Comparison

| Engine | Best For | GPU Required | Key Feature |
|---|---|---|---|
| **vLLM** | High-throughput inference | Yes (NVIDIA) | PagedAttention, continuous batching |
| **TGI** (Text Generation Inference) | Production LLM serving | Yes (NVIDIA) | Streaming, token streaming |
| **Ollama** | Simplicity, dev/small-scale | Optional (CPU works) | One command, model library |
| **Triton Inference Server** | Multi-model, multi-framework | Yes | Supports TensorRT, ONNX, PyTorch |

## Open-Source Model Catalog

### Text / LLM Models

| Category | Models |
|---|---|
| **Frontier** | gpt-oss-120B, Qwen3 235B, DeepSeek V3.1, DeepSeek R1 |
| **Reasoning** | GLM-4.5 (M,L), Qwen3 (T,S,L), MiniMax M1 (L), NVIDIA Nemotron (S,M,L), gpt-oss-20B (S), Exaone 4.0 (T,S), Hermes 4-Llama3.1 70B (M), QwQ (S), DeepSeek-Distilled (T,S,M), Llama 3.1/3.3 (S,M), Reka Flash 3 (S), Magistral Small (S) |
| **Coding** | DeepSeek V3.1/R1, Qwen3 Coder/235B, gpt-oss-120B, GLM-4.5, Kimi K2, Llama 4 Maverick |

### Model Size Tiers
- **Tiny**: <4B parameters
- **Small**: 4-40B
- **Medium**: 40-150B
- **Large**: >150B

### Other Modalities

| Type | Models |
|---|---|
| **Speech to Text** | Whisper Large v2/3, Whisper Large v3 Turbo, Fish Speech to Text, Granite 3.3 8B, Parakeet, Canary Qwen 2.5B, Voxtral |
| **Text to Speech** | Higgs Audio V2, Kokoro v1.0 82M, Dia, Chatterbox, Orpheus, Sesame CSM |
| **Vision** | CLIP, ViT, SSD, Resnet, Unet, VGG, Yolo |
| **Text from image** | BERT, RoBERTa |
| **Document Processing** | Claude, Donut, LayoutLM, DocFormer, Pix2Struct, UDOP, Idefics2 |
| **Text to Image** | HiDream-I1, Qwen-Image, FLUX, Stable Diffusion 3.5, Infinity 8B, Bagel, OmniGen V2, Bria 3.2, Sana Sprint, SDXL, Janus Pro |
| **Image Editing** | Qwen-Image-Edit, HiDream-E1.1, FLUX.1 Kontext, Bagel, OmniGen V2, Step1X-Edit |

## GPU Instance Selection

| Instance | GPU | Memory | Bandwidth | FP16 Perf | Best For |
|---|---|---|---|---|---|
| **G4** | NVIDIA T4 | 16 GB | 320 Gb/s | 65 TFLOPs | Light inference, cost-effective |
| **G5** | NVIDIA A10G | 24 GB | 600 Gb/s | 1 PFLOPs | Medium inference workloads |
| **G6** | NVIDIA L4 | 24 GB | 300 Gb/s | 1 PFLOPs | L4 for efficient inference |
| **G6e** | NVIDIA L40S | 48 GB | 864 Gb/s | 2.9 PFLOPs | Larger models on single GPU |
| **P4** | NVIDIA A100 | 40-80 GB | 2 Tb/s | 2.5 PFLOPs | Large model training & inference |
| **P5** | NVIDIA H100 | 80 GB | 3 Tb/s | 8 PFLOPs | Frontier model training |
| **P5e** | NVIDIA H200 | 141 GB | 4.8 Tb/s | 8 PFLOPs | Largest models, highest bandwidth |
| **P6** | NVIDIA B200 | 180 GB | 8 Tb/s | 18 PFLOPs | Next-gen frontier training |

### Network: EFA Bandwidth
- G4/G5/G6: 100 Gbps
- P4: 400 Gbps
- P5/P5e: 3200 Gbps
- P6: 3200 Gbps, 1800 Gbps interconnect

## AWS AI Accelerators

| Accelerator | Best For | Cost Savings |
|---|---|---|
| **Inferentia 1** | Small encoder models (<1B), LSTMs, computer vision | Up to 70% lower cost per inference |
| **Inferentia 2** | Large encoders, encoder/decoders, vision transformers, diffusion, LLM inference | Up to 40% better price performance |
| **Trainium 1** | Training large GenAI models | Up to 50% savings on training costs |
| **Trainium 2** | Training frontier models (100-1000+B) | Up to 50% savings on training costs |
| **Graviton** | Data processing, classical ML, LLM microservices (FastAPI, Open-WebUI), self-managed VectorDBs | Up to 40% better price performance, 60% less energy |

## VRAM Sizing Guide

Use https://apxml.com/tools/vram-calculator to right-size GPU instances.

### Rule of thumb
- Model parameters x 2 bytes (FP16) = minimum VRAM
- Add 20% for KV cache and overhead
- Example: 70B model -> 140GB VRAM -> 2x A100 80GB or 4x L40S 48GB

## References

- AI on EKS Blueprint: https://awslabs.github.io/ai-on-eks
- Hosting DeepSeek on Amazon EKS
- Run GenAI Inference across environments with Amazon EKS Hybrid Nodes
- VRAM Calculator: https://apxml.com/tools/vram-calculator
