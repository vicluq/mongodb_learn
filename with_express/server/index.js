const express = require('express');
const dotenv = require('dotenv');

const app = express();
dotenv.config(); // Incluindo ".env" em process.env

app.use(express.json({}));
app.use(express.urlencoded({ extended: true }));

// ... mongoose

app.listen(process.env.SERVER_PORT, () => {
    console.log(`Server is: ${'\x1b[36m'}running!${'\x1b[0m'}`)
});