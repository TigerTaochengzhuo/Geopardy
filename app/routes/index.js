var express = require('express');
var database = require('../utils/database');

var router = express.Router();

/* GET home page. */
router.get('/', function(req, res, next) {
  res.render('index', { 
    title: 'Geopardy',
    isUserLoggedIn: req.session.isUserLoggedIn
  });
});

router.get('/game', function(req, res, next) {
  res.render('game', {
      'name': 'Addy',
      'date': (new Date())
  });
});

router.get('/login', function(req, res, next) {
  res.render('login', {
      'name': 'Addy',
      'date': (new Date())
  });
});

router.get('/signin', function(req, res, next) {
  res.render('signin', {
      'name': 'Addy',
      'date': (new Date())
  });
});

router.get('/leaderboard', function(req, res, next) {

  var sql = `SELECT 
              username, score, startTime, endTime 
             FROM 
              Games, Users 
             WHERE 
              Games.userID = Users.userID AND 
              endTime IS NOT NULL 
             ORDER BY 
              score DESC;`;
              
  database.connection.query(sql, function(error, results, fields) {
    if (error) { 
     return res.render('error', error);
    }
    res.render('leaderboard', {
      'leaderboard': results
    });
  });
});


router.get('/tiger', function(req, res, next) {
  // res.send('Tiger');
  res.render('leaderboard');
});

module.exports = router;

