const express = require('express');
const router = express.Router();
const bodyParser = require('body-parser')
const db = require("../config/database");
// software_requirements

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

router.get("/newUser", async (req, res) => {

    res.render("pages/createUser.ejs", { data: {} });
        
});

router.post("/newUser", async (req, res) => {

    try {

        const { nome, sobrenome, cpf, cnpj } = req.body;

        let sql = "INSERT INTO cliente (nome, sobrenome) VALUES ($1, $2)";

        db.query(sql, [nome, sobrenome]);

        const id_cliente = 3;

        if (cpf === null) {        
            sql = `INSERT INTO pessoa_juridica (cnpj, id_cliente) VALUES (${cnpj}, ${id_cliente})`;
        } else {
            sql = `INSERT INTO pessoa_fisica (cpf, id_cliente) VALUES (${cpf}, ${id_cliente})`;
        }
        
        db.query(sql);

        res.status(201).send({
            message: "Added successfully!",
            body: req.body,            
        });

    } catch(error) {

        res.send(error);

    } 
    
});

router.post("/newDescribed", async (req, res) => {

    try {

        const { texto, id_cliente } = req.body;

        let sql = "INSERT INTO descritivo (texto, id_cliente) VALUES ($1, $2)";
        
        db.query(sql, [texto, id_cliente]);

        res.status(201).send({
            message: "Added successfully!",
            body: req.body,            
        });

    } catch(error) {

        res.send(error);

    } 
    
});

router.get("/myDescribed", async (req, res) => {

    try {
        
        const { id_cliente } = req.body;

        const sql = `SELECT * FROM descritivo WHERE id_cliente = ${id_cliente}`;

        const { rows } = await db.query(sql);
    
        res.send(rows);

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


router.get('/users', async (req, res) => {

    try {

        const sql = 'SELECT * FROM cliente';

        const { rows } = await db.query(sql);
    
        res.send(rows);

    } catch(error) {

        res.send(error);

    }

});

router.get('/userData', async (req, res) => { 

    try {

        const { cpf, cnpj } = req.body;

        let sql = null;

        if (cpf === null) {
            sql = `SELECT C.nome, C.sobrenome, J.cnpj FROM 
                cliente C INNER JOIN pessoa_juridica J 
                ON C.id = J.id_cliente AND J.cnpj = ${cnpj}`; 
        } else {
            sql = `SELECT C.nome, C.sobrenome, F.cpf FROM 
                cliente C INNER JOIN pessoa_fisica F 
                ON C.id = F.id_cliente AND F.cpf = ${cpf}`;        
        }

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