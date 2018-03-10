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

// Get Detailed Information of a Movie by Id
router.get("/getMovie/:id", (req, res) => {
  let getMovie = `SELECT * FROM tbl_movies WHERE movies_id = ${req.params.id}`;
  connect.query(getMovie, (err, result) => {
    if (err) {
      throw err;
      console.log(err);
    } else {
      console.log(result);
      res.json({
        movie: result
      });
    }
  });
});

// Get Genres of a Movie by Id
router.get("/getGenre/:id", (req, res) => {
  let getGenre = `SELECT g.* FROM tbl_movies m, tbl_mov_gen mg, tbl_genre g WHERE m.movies_id = ${
    req.params.id
  } AND m.movies_id = mg.movies_id AND mg.genre_id = g.genre_id`;
  connect.query(getGenre, (err, result) => {
    if (err) {
      throw err;
      console.log(err);
    } else {
      console.log(result);
      res.json({
        genre: result
      });
    }
  });
});

// Get Age Rating of a Movie by Id
router.get("/getAgeRating/:id", (req, res) => {
  let getAgeRating = `SELECT r.* FROM tbl_movies m, tbl_mov_ara ma, tbl_age_rating r WHERE m.movies_id = ${
    req.params.id
  } AND m.movies_id = ma.movies_id AND ma.age_rating_id = r.age_rating_id`;
  connect.query(getAgeRating, (err, result) => {
    if (err) {
      throw err;
      console.log(err);
    } else {
      console.log(result);
      res.json({
        agerating: result
      });
    }
  });
});
module.exports = router;
