# 使用 NVIDIA CUDA 基礎映像
FROM nvidia/cuda:11.8.0-cudnn8-runtime-ubuntu22.04

# 設置工作目錄
WORKDIR /app

# 安裝 Python 和 pip
RUN apt-get update && apt-get install -y python3 python3-pip

# 安裝 Python 依賴
RUN pip3 install --no-cache-dir pandas==2.1.4 torch==2.3.1 transformers==4.44.2 autoawq

# 複製應用程序代碼到容器中
COPY . .

# 設置環境變量
ENV NVIDIA_VISIBLE_DEVICES all
ENV NVIDIA_DRIVER_CAPABILITIES compute,utility

# 運行應用程序
CMD ["python3", "main.py"]