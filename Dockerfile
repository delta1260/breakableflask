FROM python:3.10-slim

# Mise à jour sécurisée des paquets
RUN apt-get update && apt-get upgrade -y && apt-get clean

# Répertoire de travail
WORKDIR /app

# Copier uniquement les fichiers nécessaires
COPY requirements.txt requirements.txt

# Installation des dépendances Python
RUN pip install --no-cache-dir -r requirements.txt

# Copier le reste du projet
COPY . .

# Utilisateur non-root pour réduire les risques
RUN useradd -m appuser
USER appuser

CMD ["python3", "main.py"]
