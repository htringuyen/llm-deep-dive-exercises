# Stage 1: Base Image
# Use NVIDIA CUDA development image with Ubuntu 24.04 and CUDA 12.6.1
FROM nvidia/cuda:12.6.1-devel-ubuntu24.04

# Stage 2: Environment Variables
ENV DEBIAN_FRONTEND=noninteractive
ENV TZ=Etc/UTC
ENV PATH="/usr/local/cuda/bin:${PATH}"
ENV LD_LIBRARY_PATH="/usr/local/cuda/lib64:${LD_LIBRARY_PATH}"

# Hugging Face cache locations
ENV HF_HOME=/workspace/.cache/huggingface
ENV HF_DATASETS_CACHE=/workspace/.cache/huggingface/datasets
ENV TRANSFORMERS_CACHE=/workspace/.cache/huggingface/models

# Stage 3: System Dependencies
RUN apt-get update && \
    apt-get install -y --no-install-recommends \
    python3.12 \
    python3.12-venv \
    python3-pip \
    git \
    wget \
    curl \
    build-essential && \
    rm -rf /var/lib/apt/lists/*

# Stage 4: Create and activate virtual environment
RUN python3.12 -m venv /opt/venv
ENV PATH="/opt/venv/bin:$PATH"

# Stage 5: Upgrade pip and install Python packages
# Copy requirements from project structure (docker/requirements.txt)
COPY requirements.txt /tmp/requirements.txt
RUN pip install --no-cache-dir --upgrade pip && \
    pip install --no-cache-dir -r /tmp/requirements.txt

# Stage 6: Configure workspace
WORKDIR /workspace

# Stage 7: Default command (Jupyter Lab for dev)
CMD ["bash", "-lc", "jupyter lab --ip=0.0.0.0 --port=8888 --no-browser --allow-root"]
