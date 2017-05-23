var express = require('express');
var router = express.Router();
var database = require('../utils/database');

var numOfGames = 0;

router.get('/game/start', function(req, res, next) {
    numOfGames++;
    res.json({
        'message': 'Game #' + numOfGames + ' Started'
    });
});

router.get('/game/questions', function(req, res, next) {
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

router.get('/game/end', function(req, res, next) {
    res.json({
      
    });
});

router.get('/leaderboard', function(req, res, next) {
    res.json({
      
    });
});

router.get('/game/:gameID/next', function(req, res, next) {
    res.json({
    
    });
});

router.get('/game/:gameID/check', function(req, res, next) {
  res.json({
      
  });
});

router.get('/signout', function(req, res, next) {
  res.json({
      
  });
});

module.exports = router;

