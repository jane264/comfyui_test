# Start from official RunPod ComfyUI worker base
FROM runpod/worker-comfyui:5.1.0-base

# Accept CivitAI API key as build argument (DO NOT hardcode)
ARG CIVITAI_API_KEY

# Download CyberRealistic XL model into checkpoints
RUN comfy model download \
    --url "https://civitai.com/api/download/models/2611295?token=${CIVITAI_API_KEY}" \
    --relative-path models/checkpoints \
    --filename cyberrealisticXL_v4.safetensors
