FROM python:3.8

WORKDIR /app

COPY requirements.txt .
COPY entrypoint.sh /entrypoint.sh


RUN apt-get update && apt-get install -y --no-install-recommends \
    netcat-openbsd postgresql-client \
 && rm -rf /var/lib/apt/lists/*

# Danach wurden deine Python-Abhängigkeiten installiert
RUN pip install --no-cache-dir -r requirements.txt

# Dein Entrypoint-Skript wurde ausführbar gemacht
#RUN chmod +x /entrypoint.sh

# Jetzt wurde dein ganzer Code kopiert
COPY . /app/

# Dann hast du wieder ins Projektverzeichnis gewechselt
WORKDIR /app/truck_signs_api

# Port 8000 geöffnet
EXPOSE 8000

# Und das Startskript festgelegt
ENTRYPOINT ["/entrypoint.sh"]
