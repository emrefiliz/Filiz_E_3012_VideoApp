var express = require('express');
var connect = require('../utils/sqlConnect');
var router = express.Router();

router.get('/', function(req, res, next) {
  res.send('respond with a resource');
});

module.exports = router;