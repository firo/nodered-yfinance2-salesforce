# Usa l'immagine Debian di base
FROM debian:latest

# Installa Node.js, npm e altri pacchetti necessari
RUN apt-get update && \
    apt-get install -y curl && \
    curl -fsSL https://deb.nodesource.com/setup_18.x | bash - && \
    apt-get install -y nodejs && \
    apt-get install -y python3 build-essential && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

# Installa Node-RED, yahoo-finance2, e node-red-contrib-salesforce
RUN npm install -g --unsafe-perm node-red && \
    npm install -g yahoo-finance2 && \
    npm install -g node-red-contrib-salesforce

# Crea una directory per Node-RED
WORKDIR /data

# Espone la porta di default di Node-RED
EXPOSE 1880

# Comando per avviare Node-RED
CMD ["node-red", "--userDir", "/data"]
