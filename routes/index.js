var express = require('express');
var router = express.Router();
var config = require('../config');

// do some checking here => check the default user profile
// ternary statement => MDN ternary
var toRender = (config.kidsmode) ? 'home_kids' : 'home';

/* GET home page. */
router.get('/', function(req, res, next) {
  res.render(toRender, {
    title: 'Video App',
    mainpage : true,
    message: 'Welcome',
    kidsmode : (config.kidsmode) ? 'Kids' : 'Adults'
  });
});

module.exports = router;