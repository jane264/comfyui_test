# start from a clean base image
FROM runpod/worker-comfyui:5.1.0-base

# download SDXL Turbo model using comfy-cli
# the "--filename" must match what you select in ComfyUI
RUN comfy model download \
    --url https://huggingface.co/stabilityai/sdxl-turbo/resolve/main/sd_xl_turbo_1.0_fp16.safetensors \
    --relative-path models/checkpoints \
    --filename sd_xl_turbo_1.0_fp16.safetensors
