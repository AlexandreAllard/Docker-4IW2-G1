# Mise en place

```bash
   docker compose up -d
   ```

## Reprise du squelette du projet

Si l'on veut reprendre le squelette du projet mais repartir d'une base API Symfony propre :
1. Supprimer le contenu du dossier api/

2. ```bash
   docker compose exec symfony symfony new --api --no-git --dir=/var/www/html
   ```

