FROM runpod/worker-comfyui:5.1.0-base

# Switch to bash for safer conditional execution
SHELL ["/bin/bash", "-c"]

# Runtime model download + start worker
CMD if [ ! -f /comfyui/models/checkpoints/cyberrealisticXL_v4.safetensors ]; then \
        echo "Downloading CyberRealisticXL model..." && \
        comfy model download \
            --url "https://civitai.com/api/download/models/2611295?token=${CIVITAI_API_KEY}" \
            --relative-path models/checkpoints \
            --filename cyberrealisticXL_v4.safetensors ; \
    else \
        echo "Model already exists, skipping download." ; \
    fi && \
    exec /start.sh
