FROM python:3.8.slim

WORKDIR /app

COPY requirements.txt .
COPY entrypoint.sh /entrypoint.sh
COPY truck_signs_designs/settings/.env /app/truck_signs_designs/settings/.env


RUN chmod +x /entrypoint.sh && apt-get update && apt-get install -y --no-install-recommends \
    netcat-openbsd postgresql-client \
 && rm -rf /var/lib/apt/lists/*

RUN pip install --no-cache-dir -r requirements.txt

COPY . /app/

WORKDIR /app

EXPOSE 8000

ENTRYPOINT ["/entrypoint.sh"]
