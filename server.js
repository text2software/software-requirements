require('./src/config/database')
const express = require('express');
const app = express();
const cors = require('cors');

app.use(cors());

app.set('views', './views');
app.set('view engine', 'ejs');

app.use(express.static('public'));
app.use('/css', express.static(__dirname + 'public/css'));
app.use('/js', express.static(__dirname + 'public/js'));

const PORT = process.env.PORT || 3000;

const userAuth = require('./src/routes/auth.routes');

app.use('/user', userAuth);

app.listen(PORT, () => {
    console.log('Running on port 3000: ' + PORT);
});

//-------------------------------------------------------
const path = require("path")
const publicDir = path.join(__dirname, './public')
app.use(express.static(publicDir))

app.get("/", (req, res) => {
    res.render("layout")
})

app.get("/signup", (req, res) => {
    res.render("signup")
})

app.get("/login", (req, res) => {
    res.render("login")
})