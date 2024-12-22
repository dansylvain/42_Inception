### **1\. Construction et Lancement des Containers**

* Construire une image Docker :  
  `docker build -t IMAGE_NAME PATH_TO_DOCKERFILE`  
* Lancer un container en mode détaché :  
  `docker run -d --name CONTAINER_NAME IMAGE_NAME`  
* Lancer un container avec des ports exposés :  
  `docker run -d -p HOST_PORT:CONTAINER_PORT --name CONTAINER_NAME IMAGE_NAME`  
* Lancer un container avec des variables d’environnement :  
  `docker run -d -e VAR_NAME=value --name CONTAINER_NAME IMAGE_NAME`  
* Lancer les services définis dans `docker-compose.yml` :  
  `docker-compose up -d`  
* Recréer les services après modification (sans rebuild complet) :  
  `docker-compose up -d --force-recreate`  
* Reconstruction complète des services (après modification du Dockerfile) :  
  `docker-compose build`

---

### **2\. Gestion des Containers**

* Lister les containers en cours d'exécution :  
  `docker ps`  
* Lister tous les containers, y compris ceux arrêtés :  
  `docker ps -a`  
* Démarrer un container arrêté :  
  `docker start CONTAINER_NAME`  
* Arrêter un container :  
  `docker stop CONTAINER_NAME`  
* Redémarrer un container :  
  `docker restart CONTAINER_NAME`  
* Supprimer un container arrêté :  
  `docker rm CONTAINER_NAME`  
* Exécuter une commande dans un container :  
  `docker exec -it CONTAINER_NAME COMMAND`  
  (Exemple : `docker exec -it CONTAINER_NAME bash` pour accéder au shell)  
* Voir l’utilisation des ressources des containers :  
  `docker stats`  
* Inspecter un container pour voir ses informations détaillées :  
  `docker inspect CONTAINER_NAME`

---

### **3\. Gestion des Logs**

* Afficher les logs d’un container :  
  `docker logs CONTAINER_NAME`  
* Afficher les logs en temps réel :  
  `docker logs -f CONTAINER_NAME`  
* Vérifier la configuration d’un service (ex. NGINX) :  
  `docker exec -it CONTAINER_NAME nginx -t`  
* Vérifier les logs de tous les services avec Docker Compose :  
  `docker-compose logs`  
* Suivre les logs en direct avec Docker Compose :  
  `docker-compose logs -f`

---

### **4\. Gestion des Images**

* Lister les images disponibles :  
  `docker images`  
* Supprimer une image :  
  `docker rmi IMAGE_NAME`  
* Supprimer toutes les images inutilisées :  
  `docker image prune`

---

### **5\. Gestion des Volumes et Réseaux**

* Lister les volumes :  
  `docker volume ls`  
* Supprimer un volume :  
  `docker volume rm VOLUME_NAME`  
* Lister les réseaux :  
  `docker network ls`  
* Supprimer un réseau :  
  `docker network rm NETWORK_NAME`

---

### **6\. Copie de Fichiers**

* Copier un fichier depuis un container vers l’hôte :  
  `docker cp CONTAINER_NAME:/path/to/file /path/on/host`  
* Copier un fichier depuis l’hôte vers un container :  
  `docker cp /path/on/host CONTAINER_NAME:/path/to/file`

---

### **7\. Nettoyage**

* Supprimer tous les containers arrêtés :  
  `docker container prune`  
* Supprimer toutes les images inutilisées :  
  `docker image prune`  
* Tout nettoyer (containers, images, volumes, réseaux) :  
  `docker system prune -a`

---

### **8\. Outils de Debug**

* Entrer dans un container :  
  `docker exec -it CONTAINER_NAME bash`  
* Vérifier si un port est bien exposé avec `netstat` :  
  `docker exec CONTAINER_NAME netstat -tuln`  
* Tester la connectivité réseau depuis un container :  
  `docker exec CONTAINER_NAME ping HOSTNAME`

### **9\. Interagir avec mysql**

* Lancer mysql:
  `mysql -u root -p`
* Afficher toutes les bases de données :
  `SHOW DATABASES;`
* Afficher les données :
  `SELECT * FROM nom_table;`
* Créer une nouvelle base de données :  
  `CREATE DATABASE nom_base_de_donnees;`  
* Utiliser une base de données :
  `USE nom_base;`
* Afficher les tables d'une base de données :
  `SHOW TABLES;`
* Ajouter une entrée dans une table :
  `INSERT INTO nom_table (colonne1, colonne2) VALUES('valeur1', 'valeur2');`
* Pour quitter MySQL, utilise la commande :
  `EXIT;`