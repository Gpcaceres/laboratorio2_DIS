const db = require('../config/db');

const Book = {
        getAllBooks: async () => {
            const [rows] = await db.query(`SELECT 1.*,
            a.nombre as autor_nombre,
            a.apellidos as autor_apellidos,
            FROM libros 1
            JOIN autor a 
            ON 1.autor_id = a.id'
            ORDEN BY 1.id`,
            );
            return rows;
        }
    };

    module.exports = Book;


    