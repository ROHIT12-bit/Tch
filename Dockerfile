# Credit: @VJ_Botz | YouTube: @Tech_VJ | Telegram: @KingVJ01

FROM python:3.10.8-slim-buster

# Fix repo sources since Buster is EOL
RUN sed -i 's|http://deb.debian.org/debian|http://archive.debian.org/debian|g' /etc/apt/sources.list && \
    sed -i '/security/d' /etc/apt/sources.list && \
    apt-get update && apt-get upgrade -y && \
    apt-get install -y git && \
    rm -rf /var/lib/apt/lists/*

# Copy requirements and install Python packages
COPY requirements.txt /requirements.txt
RUN pip3 install --no-cache-dir --upgrade pip && \
    pip3 install --no-cache-dir -r /requirements.txt

# Set working directory and copy project
WORKDIR /VJ-File-Store
COPY . .

# Run the bot
CMD ["python3", "bot.py"]
