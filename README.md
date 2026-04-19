# laboratorio2_DIS

## Ejecutar

1. Levantar MySQL:
```bash
docker compose up -d mysql
```

2. Cargar datos de ejemplo:
```bash
docker exec -i laboratorio2_mysql mysql -u admin -p admin1234 libreria_db < docker/mysql/seed.sql
```

3. Iniciar la API:
```bash
npm start
```

## Vaciar base de datos

Si necesitas dejar la base limpia y volver a empezar:

```bash
docker exec -it laboratorio2_mysql mysql -u admin -padmin1234 -e "USE libreria_db; SET FOREIGN_KEY_CHECKS = 0; TRUNCATE TABLE libros; TRUNCATE TABLE autor; SET FOREIGN_KEY_CHECKS = 1;"
```

Luego, si quieres volver a cargar datos de ejemplo:

```bash
docker exec -i laboratorio2_mysql mysql -u admin -padmin1234 libreria_db < docker/mysql/seed.sql
```

## Variables

Archivo [.env](.env):
```env
DBHOST=localhost
DB_USER=admin
DB_PASSWORD=admin1234
DB_DATABASE=libreria_db
```

## Rutas

```http
GET /api/authors
GET /api/authors/search?name=ge
GET /api/books
```