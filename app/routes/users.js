var express = require('express');
var database = require('../utils/database');
var router = express.Router();

/* GET users listing. */
router.post('/new', function(req, res, next) {
    // Create new user

    console.log(req.body);

    var sql = `INSERT INTO Users VALUES( null, '${ req.body.username }', '${ req.body.password }');`;

    database.connection.query(sql, function(error, results, fields) {
        if (error) { 
            return res.send('There was an error', error);
        }
        return res.send('User created');
    });
});

module.exports = router;
