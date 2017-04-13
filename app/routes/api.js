var express = require('express');
var router = express.Router();

var numOfGames = 0;

router.get('/game/start', function(req, res, next) {
    numOfGames++;
    res.json({
        'message': 'Game #' + numOfGames + ' Started'
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

module.exports = router;

