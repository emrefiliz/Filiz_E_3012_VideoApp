(() => {
  var movieThumbnailsDiv = document.querySelector("#movie-thumbnail");
  var artistThumbnailsDiv = document.querySelector("#artist-thumbnail");

  function getMovieCovers() {
    let url = "movie/getMovies";
    fetch(url)
      .then(resp => resp.json())
      .then(data => {
        let movieWrapper = movieThumbnailsDiv.querySelector(
          ".thumbnail-list> ul"
        );
        data.movies.forEach(({ movies_id, movies_title, movies_cover }) => {
          let movieThumbnail = `<img data-id=${movies_id} src="images/${movies_cover}" alt="${movies_title} cover" class="movie-thumbnail">`;
          movieWrapper.innerHTML += movieThumbnail;
        });
      })
      .catch(function(error) {
        console.log(error);
      });
  }

  function getArtistPhotos() {
    let url = "music/getArtists";
    fetch(url)
      .then(resp => resp.json())
      .then(data => {
        let artistWrapper = artistThumbnailsDiv.querySelector(
          ".thumbnail-list > ul"
        );
        data.movies.forEach(({ artist_id, artist_name, artist_photo }) => {
          let artistThumbnail = `<img data-id=${artist_id} src="images/${artist_photo}" alt="${artist_name} cover" class="artist-thumbnail">`;
          artistWrapper.innerHTML += artistThumbnail;
        });
      })
      .catch(function(error) {
        console.log(error);
      });
  }

  getMovieCovers.call();
  getArtistPhotos.call();
})();
