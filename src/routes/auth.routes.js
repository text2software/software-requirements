const express = require('express');
const router = express.Router();
const bodyParser = require('body-parser');
const jwt = require('../setup/jwt');
const crypto = require('crypto');
const db = require("../config/database");

router.use(bodyParser.json());

router.post('/signup', async (req, res) => {

    try {

        const { name, email, password } = req.body;

        // Criptografando a senha
        const passwordHash = crypto.createHash('md5').update(password).digest('hex');

        let sql = 'SELECT email FROM usuario WHERE email = $1';
    
        // Verificando se o email já está cadastrado.
        const { rows: doesExist } = await db.query(sql, [email]);
        
        // Dispara um erro de conflito caso o email já esxista.
        if (doesExist.length != 0) throw 409;

        sql = `
            INSERT INTO usuario (name, email, password) 
            VALUES ($1, $2, $3) RETURNING id
        `;

        // Pegando o id do usuário inserido.
        const { rows: [{ id }] } = await db.query(sql, [name, email, passwordHash]);

        // Gerando o token do usuário utilizando como payload o id.
        const token = jwt.sign({ user: id });

        res.send({
            name: name,
            email: email,
            id: id,  
            token
        });

    } catch (error) {

        res.send(error);

    }

})

router.post('/login', async (req, res) => {
    
    try {

        const { email, password } = req.body;

        // Criptografando a senha para fazer a busca com base na hash
        const passwordHash = crypto.createHash('md5').update(password).digest('hex');

        let sql = 'SELECT id, name, email FROM usuario WHERE email = $1 AND password = $2';
    
        // Buscando o usuário com base nas credencias fornecidas.
        const { rows: user } = await db.query(sql, [email, passwordHash]);

        // Verificando se o usuário existe
        if (user.length == 0) return res.send(401);

        // Gerando o tokendo do usuário
        const token = jwt.sign({ user: user[0].id });

        res.send({ user, token });

    } catch (error) {

        res.send(error);

    }

});



module.exports = router