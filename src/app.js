const express = require('express');
const authorController = require('./controller/authorController');
const bookController = require('./controller/bookController');

const app = express();
const PORT = process.env.PORT || 3000;

app.use(express.json());

app.get('/', (req, res) => {
	res.json({
		message: 'API laboratorio2_DIS activa',
		uris: {
			getAuthors: 'GET /api/authors',
			createAuthor: 'POST /api/authors',
			updateAuthor: 'PUT /api/authors/:id',
			deleteAuthor: 'DELETE /api/authors/:id',
			getBooks: 'GET /api/books',
			createBook: 'POST /api/books',
			updateBook: 'PUT /api/books/:id',
			deleteBook: 'DELETE /api/books/:id'
		}
	});
});

app.get('/api/authors', authorController.getAllAuthors);
app.post('/api/authors', authorController.createAuthor);
app.put('/api/authors/:id', authorController.updateAuthor);
app.delete('/api/authors/:id', authorController.deleteAuthor);

app.get('/api/books', bookController.getAllBooks);
app.post('/api/books', bookController.createBook);
app.put('/api/books/:id', bookController.updateBook);
app.delete('/api/books/:id', bookController.deleteBook);

app.listen(PORT, () => {
	console.log(`Servidor corriendo en http://localhost:${PORT}`);
});
