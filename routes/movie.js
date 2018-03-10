var express = require("express");
var connect = require("../utils/sqlConnect");
var router = express.Router();

/* GET movie listing. */
router.get("/", function(req, res, next) {
  res.render("movie", {
    title: "Movie",
    message: "Movies"
  });
});

// Get Movies
router.get("/getMovies", (req, res) => {
  let getMovies = `SELECT movies_id, movies_title, movies_cover FROM tbl_movies ORDER BY movies_id`;
  connect.query(getMovies, (err, result) => {
    if (err) {
      throw err;
      console.log(err);
    } else {
      console.log(result);
      res.json({
        movies: result
      });
    }
  });
});

module.exports = router;
