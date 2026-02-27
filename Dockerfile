FROM runpod/worker-comfyui:5.1.0-base

# Install curl
RUN apt-get update && apt-get install -y curl

# Start script: download model at container start (not build time)
CMD if [ ! -f /comfyui/models/checkpoints/cyberrealisticXL_v4.safetensors ]; then \
      curl -L -H "Authorization: Bearer $CIVITAI_API_KEY" \
      "https://civitai.com/api/download/models/2611295" \
      -o /comfyui/models/checkpoints/cyberrealisticXL_v4.safetensors ; \
    fi && \
    /start.sh
