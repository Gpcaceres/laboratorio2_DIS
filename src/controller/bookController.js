const book = require('../models/bookModel');

const getAllBooks = async (req, res) => {
    try {
        const books = await book.getAllBooks();
        res.json(books);
    } catch (error) {
        console.error('Error fetching books:', error);
        res.status(500).json({ error: 'Internal Server Error' });
    }
};

const createBook = async (req, res) => {
    try {
        const newBook = await book.createBook(req.body);
        res.status(201).json(newBook);
    } catch (error) {
        console.error('Error creating book:', error);
        res.status(500).json({ error: 'Internal Server Error' });
    }
};

const updateBook = async (req, res) => {
    try {
        const updatedBook = await book.updateBook(req.params.id, req.body);
        res.json(updatedBook);
    } catch (error) {
        console.error('Error updating book:', error);
        res.status(500).json({ error: 'Internal Server Error' });
    }
};

const deleteBook = async (req, res) => {
    try {
        const result = await book.deleteBook(req.params.id);
        res.json(result);
    } catch (error) {
        console.error('Error deleting book:', error);
        res.status(500).json({ error: 'Internal Server Error' });
    }
};

module.exports = {
    getAllBooks,
    createBook,
    updateBook,
    deleteBook
};
