CREATE DATABASE IF NOT EXISTS libreria_db;
USE libreria_db;

CREATE TABLE IF NOT EXISTS autor (
  id INT AUTO_INCREMENT PRIMARY KEY,
  nombre VARCHAR(100) NOT NULL,
  apellidos VARCHAR(100) NOT NULL,
  fecha_nacimiento DATE NULL,
  nacionalidad VARCHAR(100) NULL,
  correo_electronico VARCHAR(150) NULL,
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

CREATE TABLE IF NOT EXISTS libros (
  id INT AUTO_INCREMENT PRIMARY KEY,
  titulo VARCHAR(200) NOT NULL,
  autor_id INT NOT NULL,
  anio_publicacion YEAR NULL,
  isbn VARCHAR(20) UNIQUE,
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  CONSTRAINT fk_libros_autor
    FOREIGN KEY (autor_id) REFERENCES autor(id)
    ON DELETE CASCADE
    ON UPDATE CASCADE
);

DROP PROCEDURE IF EXISTS sp_get_authors;
DROP PROCEDURE IF EXISTS sp_search_authors_by_name;
DROP PROCEDURE IF EXISTS sp_create_author;
DROP PROCEDURE IF EXISTS sp_update_author;
DROP PROCEDURE IF EXISTS sp_delete_author;

DROP PROCEDURE IF EXISTS sp_get_books;
DROP PROCEDURE IF EXISTS sp_create_book;
DROP PROCEDURE IF EXISTS sp_update_book;
DROP PROCEDURE IF EXISTS sp_delete_book;

DELIMITER $$

CREATE PROCEDURE sp_get_authors()
BEGIN
  SELECT id,
         nombre,
         apellidos,
         fecha_nacimiento,
         nacionalidad,
         correo_electronico
  FROM autor
  ORDER BY id;
END $$

CREATE PROCEDURE sp_search_authors_by_name(IN p_name VARCHAR(100))
BEGIN
  SELECT id,
         nombre,
         apellidos,
         fecha_nacimiento,
         nacionalidad,
         correo_electronico
  FROM autor
  WHERE nombre COLLATE utf8mb4_0900_ai_ci LIKE CONCAT('%', p_name, '%')
  ORDER BY
    CASE
      WHEN nombre COLLATE utf8mb4_0900_ai_ci = p_name THEN 0
      WHEN nombre COLLATE utf8mb4_0900_ai_ci LIKE CONCAT(p_name, '%') THEN 1
      ELSE 2
    END,
    nombre;
END $$

CREATE PROCEDURE sp_create_author(
  IN p_nombre VARCHAR(100),
  IN p_apellidos VARCHAR(100),
  IN p_fecha_nacimiento DATE,
  IN p_nacionalidad VARCHAR(100),
  IN p_correo_electronico VARCHAR(150)
)
BEGIN
  INSERT INTO autor (nombre, apellidos, fecha_nacimiento, nacionalidad, correo_electronico)
  VALUES (p_nombre, p_apellidos, p_fecha_nacimiento, p_nacionalidad, p_correo_electronico);

  SELECT id,
         nombre,
         apellidos,
         fecha_nacimiento,
         nacionalidad,
         correo_electronico
  FROM autor
  WHERE id = LAST_INSERT_ID();
END $$

CREATE PROCEDURE sp_update_author(
  IN p_id INT,
  IN p_nombre VARCHAR(100),
  IN p_apellidos VARCHAR(100),
  IN p_fecha_nacimiento DATE,
  IN p_nacionalidad VARCHAR(100),
  IN p_correo_electronico VARCHAR(150)
)
BEGIN
  UPDATE autor
  SET nombre = p_nombre,
      apellidos = p_apellidos,
      fecha_nacimiento = p_fecha_nacimiento,
      nacionalidad = p_nacionalidad,
      correo_electronico = p_correo_electronico
  WHERE id = p_id;

  SELECT id,
         nombre,
         apellidos,
         fecha_nacimiento,
         nacionalidad,
         correo_electronico
  FROM autor
  WHERE id = p_id;
END $$

CREATE PROCEDURE sp_delete_author(IN p_id INT)
BEGIN
  DELETE FROM autor WHERE id = p_id;
END $$

CREATE PROCEDURE sp_get_books()
BEGIN
  SELECT l.id,
         l.titulo,
         l.autor_id,
         l.anio_publicacion,
         l.isbn,
         a.nombre AS autor_nombre,
         a.apellidos AS autor_apellidos
  FROM libros l
  JOIN autor a ON l.autor_id = a.id
  ORDER BY l.id;
END $$

CREATE PROCEDURE sp_create_book(
  IN p_titulo VARCHAR(200),
  IN p_autor_id INT,
  IN p_anio_publicacion YEAR,
  IN p_isbn VARCHAR(20)
)
BEGIN
  INSERT INTO libros (titulo, autor_id, anio_publicacion, isbn)
  VALUES (p_titulo, p_autor_id, p_anio_publicacion, p_isbn);

  SELECT l.id,
         l.titulo,
         l.autor_id,
         l.anio_publicacion,
         l.isbn,
         a.nombre AS autor_nombre,
         a.apellidos AS autor_apellidos
  FROM libros l
  JOIN autor a ON l.autor_id = a.id
  WHERE l.id = LAST_INSERT_ID();
END $$

CREATE PROCEDURE sp_update_book(
  IN p_id INT,
  IN p_titulo VARCHAR(200),
  IN p_autor_id INT,
  IN p_anio_publicacion YEAR,
  IN p_isbn VARCHAR(20)
)
BEGIN
  UPDATE libros
  SET titulo = p_titulo,
      autor_id = p_autor_id,
      anio_publicacion = p_anio_publicacion,
      isbn = p_isbn
  WHERE id = p_id;

  SELECT l.id,
         l.titulo,
         l.autor_id,
         l.anio_publicacion,
         l.isbn,
         a.nombre AS autor_nombre,
         a.apellidos AS autor_apellidos
  FROM libros l
  JOIN autor a ON l.autor_id = a.id
  WHERE l.id = p_id;
END $$

CREATE PROCEDURE sp_delete_book(IN p_id INT)
BEGIN
  DELETE FROM libros WHERE id = p_id;
END $$

DELIMITER ;
