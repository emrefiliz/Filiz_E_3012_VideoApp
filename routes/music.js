var express = require("express");
var connect = require("../utils/sqlConnect");
var router = express.Router();

/* GET music listing. */
router.get("/", function(req, res, next) {
  res.render("music", {
    title: "Music",
    message: "Music"
  });
});

// Get Artists
router.get("/getArtists", (req, res) => {
  let getArtists = `SELECT artist_id, artist_name, artist_photo FROM tbl_artist ORDER BY artist_id`;
  connect.query(getArtists, (err, result) => {
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
