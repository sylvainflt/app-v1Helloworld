# Utilise une image officielle Node.js (version LTS)
FROM node:18-alpine

# Crée un dossier de travail dans le conteneur
WORKDIR /app

# Copie les fichiers package.json et package-lock.json
COPY package*.json ./

# Installe les dépendances (utilise npm, ou yarn si tu préfères)
RUN npm install --production

# Copie le reste des fichiers de l'app
COPY . .

# Expose le port sur lequel ton app écoute (modifie si besoin)
EXPOSE 3000

# Commande pour démarrer l'application
CMD ["node", "index.js"]
