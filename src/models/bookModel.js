const db = require('../config/db');

const firstResultSet = (rows) => (Array.isArray(rows[0]) ? rows[0] : rows);

const Book = {
    getAllBooks: async () => {
        const [rows] = await db.query('CALL sp_get_books()');
        return firstResultSet(rows);
    },

    createBook: async (payload) => {
        const { titulo, autor_id, anio_publicacion, isbn } = payload;
        const [rows] = await db.query(
            'CALL sp_create_book(?, ?, ?, ?)',
            [titulo, autor_id, anio_publicacion ?? null, isbn ?? null]
        );
        const created = firstResultSet(rows)[0];
        return created || null;
    },

    updateBook: async (id, payload) => {
        const { titulo, autor_id, anio_publicacion, isbn } = payload;
        const [rows] = await db.query(
            'CALL sp_update_book(?, ?, ?, ?, ?)',
            [id, titulo, autor_id, anio_publicacion ?? null, isbn ?? null]
        );
        const updated = firstResultSet(rows)[0];
        return updated || null;
    },

    deleteBook: async (id) => {
        await db.query('CALL sp_delete_book(?)', [id]);
        return { message: `Libro con id ${id} eliminado` };
    }
};

module.exports = Book;


