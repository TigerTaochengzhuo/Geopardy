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
  if (!req.session.isUserLoggedIn) {
    return res.redirect('/signin');
  } {
    return res.render('game', {
        'name': 'Addy',
        'date': (new Date())
    });
  }
});

router.get('/gameover', function(req, res, next) {
  res.render('gameover', {
      'name': 'Addy',
      'date': (new Date())
  });
});

router.get('/create', function(req, res, next) {
  res.render('create', {
      'error': req.query.error
  });
});

router.get('/signin', function(req, res, next) {
  res.render('signin', {
      'error': req.query.error
  });
});

router.get('/signout', function(req, res, next) {
  res.render('signout', {
      'name': 'Addy',
      'date': (new Date())
  });
});

router.get('/user/welcome', function(req, res, next) {
  res.render('welcome', {
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

