const db = require('../config/db');

const firstResultSet = (rows) => (Array.isArray(rows[0]) ? rows[0] : rows);

const Autor = {
    getAllAuthors: async () => {
        const [rows] = await db.query('CALL sp_get_authors()');
        return firstResultSet(rows);
    },

    searchAuthorsByName: async (name) => {
        const searchName = (name || '').trim();
        if (!searchName) {
            return [];
        }

        const [rows] = await db.query('CALL sp_search_authors_by_name(?)', [searchName]);
        return firstResultSet(rows);
    },

    createAuthor: async (payload) => {
        const { nombres, apellidos, fecha_nacimiento, nacionalidad, correo_electronico } = payload;
        const [rows] = await db.query(
            'CALL sp_create_author(?, ?, ?, ?, ?)',
            [nombres, apellidos, fecha_nacimiento, nacionalidad, correo_electronico]
        );
        const created = firstResultSet(rows)[0];
        return created || null;
    },

    updateAuthor: async (id, payload) => {
        const { nombres, apellidos, fecha_nacimiento, nacionalidad, correo_electronico } = payload;
        const [rows] = await db.query(
            'CALL sp_update_author(?, ?, ?, ?, ?, ?)',
            [id, nombres, apellidos, fecha_nacimiento, nacionalidad, correo_electronico]
        );
        const updated = firstResultSet(rows)[0];
        return updated || null;
    },

    deleteAuthor: async (id) => {
        await db.query('CALL sp_delete_author(?)', [id]);
        return { message: `Autor con id ${id} eliminado` };
    }
}

module.exports = Autor;