const db = require('../config/db');

const Autor= {
    findAll: async()=>{
        const [rows] = await db.query('SELECT * FROM autor');
        return rows;
    },

    createAuthor: async (nombres, apellidos, fecha_nacimiento, nacionalidad, correo_electrónico) => {
        const consulta = 'INSERT INTO autor (nombre, apellidos, fecha_nacimiento, nacionalidad, correo_electrónico) VALUES (?, ?, ?, ?, ?)';
        const values = [nombres, apellidos, fecha_nacimiento, nacionalidad, correo_electrónico];
    
        const [result] = await db.query(consulta, values);
        return{ id: result.insertId,nombres, apellidos, fecha_nacimiento, nacionalidad, correo_electrónico };
    },

    updateAuthor: async (id, nombres, apellidos, fecha_nacimiento, nacionalidad, correo_electrónico) => {
        const consulta = 'UPDATE autor SET nombre = ?, apellidos = ?, fecha_nacimiento = ?, nacionalidad = ?, correo_electrónico = ? WHERE id = ?';
        const values = [nombres, apellidos, fecha_nacimiento, nacionalidad, correo_electrónico, id];
    
        await db.query(consulta, values);// Ejecutar la consulta de actualización
        return { id, nombres, apellidos, fecha_nacimiento, nacionalidad, correo_electrónico };
    },

    deleteAuthor: async (id) => {
        const consulta = 'DELETE FROM autor WHERE id = ?';
        await db.query(consulta, [id]);
        return { message: `Autor con id ${id} eliminado` };
    }
}

module.exports = Autor;