# Start from official RunPod ComfyUI worker base
FROM runpod/worker-comfyui:5.1.0-base

# Accept API key as build argument (NOT hardcoded)
ARG CIVITAI_API_KEY

# Install curl
RUN apt-get update && apt-get install -y curl

# Download CyberRealistic XL from CivitAI using API token
RUN curl -L \
    -H "Authorization: Bearer ${CIVITAI_API_KEY}" \
    -o /comfyui/models/checkpoints/cyberrealisticXL_v4.safetensors \
    "https://civitai.com/api/download/models/2611295"

# Clean up
RUN apt-get clean && rm -rf /var/lib/apt/lists/*
