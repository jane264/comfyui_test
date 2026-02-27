FROM runpod/worker-comfyui:5.1.0-base

# Download model at container startup (only if missing)
CMD if [ ! -f /comfyui/models/checkpoints/cyberrealisticXL_v4.safetensors ]; then \
        comfy model download \
          --url "https://civitai.com/api/download/models/2611295?token=${CIVITAI_API_KEY}" \
          --relative-path models/checkpoints \
          --filename cyberrealisticXL_v4.safetensors ; \
    fi && \
    /start.sh
