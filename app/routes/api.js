var express = require('express');
var router = express.Router();
var database = require('../utils/database');

var numOfGames = 0;

router.post('/game/start', function(req, res, next) {
    if (!req.session.userObject || !req.session.userObject.userID) {
        return res.json({ error: '' });
    }
    
    var userID = req.session.userObject.userID;
    var sql = `INSERT INTO Games VALUES(null, ?, 0, ?, null)`;

    database.connection.query(
        sql, 
        [userID, (new Date())],
        function(error, results, fields) {
            if (error) { 
                return res.send('There was an error', error);
            }
            res.json({
                'gameID': results.insertId,
                'message': 'Game #' + results.insertId + ' Started'
            });
        }
    );
});

router.post('/game/questions', function(req, res, next) {
    if (!req.session.userObject || !req.session.userObject.userID || !req.body.gameID) {
        return res.json({ error: '' });
    }

    var gameID = req.body.gameID;
    var sql = `SELECT * FROM Answers ORDER BY RAND() LIMIT 1`;

    database.connection.query(sql, function(error, results, fields) {
        console.log( error, results)
        if (error) { 
            return res.send('There was an error', error);
        }
        return res.json({
            answer: results[0]
        });
    });    
    
});

router.post('/game/end', function(req, res, next) {
    if (!req.session.userObject || !req.session.userObject.userID) {
        return res.json({ error: 'Not Logged In' });
    }

    if (!req.body.gameID || !req.body.score) {
        console.log(req.body);
        return res.json({ error: 'Invalid Data' });
    }

    var score = req.body.score;
    var gameID = req.body.gameID;
    var userID = req.session.userObject.userID;
    var sql = `UPDATE Games SET endTime = ?, score = ? WHERE gameID = ?`;

    database.connection.query(
        sql, 
        [(new Date()), score, gameID],
        function(error, results, fields) {
            if (error) { 
                return res.send('There was an error', error);
            }
            res.json({ 'message': 'Game Ended' });
        }
    );
});

module.exports = router;

