# Python 3.9 imajını kullanarak başla
FROM python:3.9-slim

# Sistem bağımlılıklarını yükle
RUN apt-get update && apt-get install -y \
    curl \
    wget \
    libx11-dev \
    libgdk-pixbuf2.0-dev \
    libgtk-3-dev \
    libdbus-1-dev \
    libxtst6 \
    libnss3 \
    libasound2 \
    libatk1.0-0 \
    libatk-bridge2.0-0 \
    libnspr4 \
    libxcomposite1 \
    libxrandr2 \
    libepoxy0 \
    libpangocairo-1.0-0 \
    && apt-get clean

# Pip ile Robot Framework ve diğer bağımlılıkları yükle
COPY requirements.txt /requirements.txt
RUN pip install --no-cache-dir -r /requirements.txt

# Çalıştırılacak komut
WORKDIR /app
