FROM runpod/worker-comfyui:5.1.0-base

RUN comfy model download --url https://huggingface.co/stabilityai/sdxl-turbo/resolve/main/sd_xl_turbo_1.0_fp16.safetensors --relative-path models/checkpoints --filename sd_xl_turbo_1.0_fp16.safetensors
