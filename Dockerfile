# Utilise une image Node.js LTS légère et sécurisée
FROM node:18-alpine

# Définir le répertoire de travail
WORKDIR /app

# Copier les fichiers de dépendances d'abord
COPY package*.json ./

# Installer les dépendances en mode production
RUN npm ci --omit=dev

# Copier le reste de l'application
COPY . .

# Donne les bons droits pour l'exécution avec UID arbitraire (OpenShift)
RUN chown -R node:node /app

# Utilise l'utilisateur "node" fourni par l'image officielle
USER node

# Expose le port (assure-toi qu’il correspond à celui écouté par ton app)
EXPOSE 3000

# Lancer l'application (modifie selon ton point d’entrée)
CMD ["node", "index.js"]
