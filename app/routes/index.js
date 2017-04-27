var express = require('express');
var router = express.Router();

/* GET home page. */
router.get('/', function(req, res, next) {
  res.render('index', { title: 'Geopardy' });
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

router.get('/tiger', function(req, res, next) {
  // res.send('Tiger');
  res.render('leaderboard');
});

module.exports = router;

