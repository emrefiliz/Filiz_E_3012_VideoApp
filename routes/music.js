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
        artists: result
      });
    }
  });
});

// Get Detailed Information of an Artist by Id
router.get("/getArtist/:id", (req, res) => {
  let getArtist = `SELECT * FROM tbl_artist WHERE artist_id = ${req.params.id}`;
  connect.query(getArtist, (err, result) => {
    if (err) {
      throw err;
      console.log(err);
    } else {
      console.log(result);
      res.json({
        artist: result
      });
    }
  });
});

module.exports = router;
