var express = require('express');
var database = require('../utils/database');
var router = express.Router();

/* GET users listing. */
router.get('/welcome', function(req, res, next) {
    // Create new user
    return res.render('welcome');
});

/* GET users listing. */
router.post('/new', function(req, res, next) {
    // Create new user

    console.log(req.body);

    var sql = `INSERT INTO Users VALUES( null, '${ req.body.username }', '${ req.body.password }');`;

    database.connection.query(sql, function(error, results, fields) {
        if (error) { 
            return res.send('There was an error', error);
        }
        return res.redirect('/signin?newuser=true');
    });
});

/* GET users listing. */
router.post('/signin', function(req, res, next
) {
    // Create new user

    console.log(req.body);

    var sql = `SELECT * FROM Users WHERE username = '${ req.body.username.toLowerCase() }' AND password = '${ req.body.password }';`;
    console.log(sql)
    database.connection.query(sql, function(error, results, fields) {
        console.log( error, results)
        if (error) { 
            return res.send('There was an error', error);
        }
        if (results.length > 0) {
            req.session.userObject = results[0];
            req.session.isUserLoggedIn = true;
            return res.redirect('/');
        } else {
            req.session.userObject = null;
            req.session.isUserLoggedIn = false;
            return res.redirect('/signin?error=true');
        }
    });
});

/* GET users listing. */
router.post('/signout', function(req, res, next) {
    // Create new user
    req.session.userObject = null;
    req.session.isUserLoggedIn = false;
    return res.redirect('/');
});


module.exports = router;
