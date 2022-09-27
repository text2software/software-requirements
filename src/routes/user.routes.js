const express = require('express');
const router = express.Router();
const bodyParser = require('body-parser')
const db = require("../config/database");

router.use(bodyParser.json());


router.get("/", async (req, res) => {

    try {

        const sql = 'SELECT * FROM teste';
    
        const { rows } = await db.query(sql);
    
        res.render("pages/index.ejs", { query: rows });    

        // res.send(rows);

    } catch(error) {

        res.send(error);

    }
    
});

router.get("/home", async (req, res) => {

    try {
    
        res.render("pages/home.ejs", {}); 

    } catch(error) {

        res.send(error);

    }
    
});


router.get('/select', async (req, res) => {

    try {

        const sql = 'SELECT * FROM teste';

        const { rows } = await db.query(sql);
    
        res.send(rows);

    } catch(error) {

        res.send(error);

    }

});

router.post('/post', async (req, res) => {

    try {

        const { id, nome } = req.body;

        const sql = "INSERT INTO teste (id, nome) VALUES ($1, $2)";

        const { rows } = await db.query(sql, [id, nome]);

        res.status(201).send({
            message: "Product added successfully!",
            body: {
                product: { id, nome }
            },
        });

    } catch(error) {

        res.send(error);

    }  

});

router.post('/delet', async (req, res) => {

    try {

        const { id, nome } = req.body;

        const sql = "DELETE FROM teste WHERE id = $1";

        const { rows } = await db.query( sql, [id] );

        res.send(rows);

    } catch(error) {

        res.send(error);

    }  

});

module.exports = router;