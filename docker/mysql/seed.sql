USE libreria_db;

SET FOREIGN_KEY_CHECKS = 0;
TRUNCATE TABLE libros;
TRUNCATE TABLE autor;
SET FOREIGN_KEY_CHECKS = 1;

INSERT INTO autor (id, nombre, apellidos, fecha_nacimiento, nacionalidad, correo_electronico) VALUES
(1, 'Gabriel', 'García Márquez', '1927-03-06', 'Colombiana', 'gabriel@example.com'),
(2, 'German', 'Borges', '1941-08-24', 'Argentina', 'german@example.com'),
(3, 'Genaro', 'Pérez', '1980-01-15', 'Mexicana', 'genaro@example.com'),
(4, 'Germania', 'Lopez', '1975-11-02', 'Española', 'germania@example.com'),
(5, 'Ana', 'Torres', '1990-05-20', 'Peruana', 'ana@example.com'),
(6, 'Gerardo', 'Méndez', '1988-09-13', 'Mexicana', 'gerardo@example.com'),
(7, 'Germán', 'Rojas', '1979-12-01', 'Chilena', 'german.rojas@example.com'),
(8, 'Verónica', 'Sánchez', '1984-07-22', 'Argentina', 'veronica@example.com'),
(9, 'Georgina', 'Castillo', '1992-04-10', 'Uruguaya', 'georgina@example.com'),
(10, 'Jorge', 'Gómez', '1965-02-18', 'Mexicana', 'jorge@example.com'),
(11, 'María', 'Fernández', '1987-06-30', 'Española', 'maria@example.com'),
(12, 'Luis', 'Ramírez', '1978-03-11', 'Colombiana', 'luis@example.com'),
(13, 'Camila', 'Duarte', '1994-09-27', 'Peruana', 'camila@example.com'),
(14, 'Sofía', 'Morales', '1991-12-05', 'Chilena', 'sofia@example.com'),
(15, 'Ricardo', 'Navarro', '1982-08-19', 'Argentina', 'ricardo@example.com'),
(16, 'Patricia', 'Vega', '1989-01-09', 'Mexicana', 'patricia@example.com');

INSERT INTO libros (titulo, autor_id, anio_publicacion, isbn) VALUES
('Cien años de soledad', 1, 1967, '9780307474728'),
('El amor en los tiempos del cólera', 1, 1985, '9780307389732'),
('Ficciones', 2, 1944, '9788466310437'),
('El Aleph', 2, 1949, '9788420430040'),
('Historias de Genaro', 3, 2012, '9786070000001'),
('Germania y sus relatos', 4, 2009, '9786070000002'),
('Cuentos de Ana', 5, 2018, '9786070000003'),
('Crónicas de Gerardo', 6, 2015, '9786070000004'),
('La sombra de Germán', 7, 2001, '9786070000005'),
('Luz y memoria', 8, 2010, '9786070000006'),
('Geografías íntimas', 9, 2019, '9786070000007'),
('Viajes de Jorge', 10, 2007, '9786070000008'),
('El cuaderno de Gabriel', 1, 1999, '9786070000009'),
('El retorno de Genaro', 3, 2020, '9786070000010'),
('Secretos de Germania', 4, 2011, '9786070000011'),
('Historias de Verónica', 8, 2016, '9786070000012'),
('Bitácora de Georgina', 9, 2021, '9786070000013'),
('Relatos de invierno', 10, 1995, '9786070000014'),
('Cartas desde Madrid', 11, 2014, '9786070000015'),
('La casa del faro', 11, 2022, '9786070000016'),
('Memorias del río', 12, 2003, '9786070000017'),
('Ciudad de lluvia', 12, 2017, '9786070000018'),
('El mapa de los sueños', 13, 2020, '9786070000019'),
('Noches en Lima', 13, 2019, '9786070000020'),
('Primavera en el sur', 14, 2013, '9786070000021'),
('Tiempo de ceniza', 14, 2021, '9786070000022'),
('Puentes de papel', 15, 2011, '9786070000023'),
('El último puerto', 15, 2023, '9786070000024'),
('Horizonte azul', 16, 2018, '9786070000025'),
('Rutas invisibles', 16, 2024, '9786070000026');

ALTER TABLE autor AUTO_INCREMENT = 17;
ALTER TABLE libros AUTO_INCREMENT = 27;
