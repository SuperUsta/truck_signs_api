FROM python:3.8

WORKDIR /app

COPY requirements.txt .
COPY entrypoint.sh /entrypoint.sh


RUN chmod +x /entrypoint.sh && apt-get update && apt-get install -y --no-install-recommends \
    netcat-openbsd postgresql-client \
 && rm -rf /var/lib/apt/lists/*

RUN pip install --no-cache-dir -r requirements.txt

COPY . /app/

WORKDIR /app/truck_signs_api

EXPOSE 8000

ENTRYPOINT ["/entrypoint.sh"]
