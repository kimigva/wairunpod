# clean base image containing only comfyui, comfy-cli and comfyui-manager
FROM runpod/worker-comfyui:5.5.1-base

# install custom nodes into comfyui (first node with --mode remote to fetch updated cache)
# The workflow contains custom nodes in the `unknown_registry` group but none provide an aux_id (GitHub repo).
# These nodes could not be resolved or installed automatically:
# - MarkdownNote
# - MarkdownNote
# - MarkdownNote
# - MarkdownNote
# If you can provide GitHub repos (aux_id) or registry IDs for these, they can be added here. Example for a GitHub aux_id:
# RUN git clone https://github.com/<owner>/<repo> /comfyui/custom_nodes/<repo>

# download models into comfyui
RUN comfy model download --url "https://civitai.com/api/download/models/2514310?type=Model&format=SafeTensor&size=pruned&fp=fp16" --relative-path models/checkpoints --filename waiIllustriousSDXL_v160.safetensors
# RUN # Could not find URL for <model-name>

# copy all input data (like images or videos) into comfyui (uncomment and adjust if needed)
# COPY input/ /comfyui/input/
