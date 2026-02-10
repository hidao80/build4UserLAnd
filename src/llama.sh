#!/bin/sh

# Install build tools & libraries
sudo apt update
sudo apt install -y cmake build-essential libssl-div

# Download newest source code
git clone https://github.com/ggml-org/llama.cpp.git --depth=1

# Build llmam.cpp
cd llama.cpp && \
cmake -B build -DLLAMA_OPENSSL=ON && \
cmake --build build --config Release -j4 && \
sudo cmake --install build && \
sudo ldconfig

# Start-up llmam.cpp with WebUI
llama-server -hf Qwen/Qwen2.5-3B-Instruct-GGUF:Q4_K_M --port 8080
