require('./src/config/database')
const express = require('express');
const app = express();
const cors = require('cors');

app.use(cors());

app.set('views', './views');
app.set('view engine', 'ejs');

app.use(express.static('public'));
app.use('/css', express.static(__dirname + 'public/css'));

const PORT = process.env.PORT || 3000;

const userRoutes = require('./src/routes/user.routes');

app.use('/system', userRoutes);

app.listen(PORT, () => {
    console.log('Running on port 3000: ' + PORT);
});