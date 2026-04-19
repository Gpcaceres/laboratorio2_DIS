const author = require('../models/authorModel');

const getAllAuthors = async (req, res) => {
    try {
        const authors = await author.getAllAuthors();
        res.json(authors);
    } catch (error) {
        console.error('Error fetching authors:', error);
        res.status(500).json({ error: 'Internal Server Error' });
    }
}

const searchAuthors = async (req, res) => {
    try {
        const { name } = req.query;

        if (!name?.trim()) {
            return res.status(400).json({ error: 'Query parameter name is required' });
        }

        const authors = await author.searchAuthorsByName(name);
        res.json(authors);
    } catch (error) {
        console.error('Error searching authors:', error);
        res.status(500).json({ error: 'Internal Server Error' });
    }
}

const createAuthor = async (req, res) => {
    try {
        const newAuthor = await author.createAuthor(req.body);
        res.status(201).json(newAuthor);
    } catch (error) {
        console.error('Error creating author:', error);
        res.status(500).json({ error: 'Internal Server Error' });
    }
}

const updateAuthor = async (req, res) => {
    try {
        const updatedAuthor = await author.updateAuthor(req.params.id, req.body);
        res.json(updatedAuthor);
    } catch (error) {
        console.error('Error updating author:', error);
        res.status(500).json({ error: 'Internal Server Error' });
    }
}

const deleteAuthor = async (req, res) => {
    try {
        const result = await author.deleteAuthor(req.params.id);
        res.json(result);
    } catch (error) {
        console.error('Error deleting author:', error);
        res.status(500).json({ error: 'Internal Server Error' });
    }
}

module.exports = {
    getAllAuthors,
    searchAuthors,
    createAuthor,
    updateAuthor,
    deleteAuthor
};