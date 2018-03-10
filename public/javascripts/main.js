(() => {
  var movieThumbnailsDiv = document.querySelector("#movie-thumbnail");
  var artistThumbnailsDiv = document.querySelector("#artist-thumbnail");

  function getMoviePosters() {
    let url = "movie/getMovies";
    fetch(url)
      .then(resp => resp.json())
      .then(data => {
        let movieWrapper = movieThumbnailsDiv.querySelector(".thumbnail-list");
        data.movies.forEach(({ movies_id, movies_title, movies_cover }) => {
          let movieThumbnail = `<div class="card"><img data-id=${movies_id} data-toggle="modal" data-target="#movieModal" src="images/${movies_cover}" alt="${movies_title} cover" class="card-img-top movie-thumbnail"><div class="card-body">
          <h5 class="card-title">${movies_title}</h5></div></div>`;
          movieWrapper.innerHTML += movieThumbnail;
        });
        let movies = movieWrapper.querySelectorAll(".movie-thumbnail");
        movies.forEach(movie => {
          movie.addEventListener("click", getMovieDetails, false);
        });
      })
      .catch(function(error) {
        console.log(error);
      });
  }

  //
  function getMovieDetails(evt) {
    let id = evt.currentTarget.dataset.id;
    getMovieInformation(id);
    getMovieGenre(id);
    getParentalRatingofMovie(id);
  }

  //
  function getMovieInformation(movieId) {
    let url = "movie/getMovie/" + movieId;
    fetch(url)
      .then(resp => resp.json())
      .then(data => {
        let movieModal = document.querySelector("#movieModal");
        let movieTitle = movieModal.querySelector("#movieModalLabel");
        let movieYear = movieModal.querySelector("#movieYear");
        let movieCover = movieModal.querySelector("#modalPhoto");
        let movieRating = movieModal.querySelector("#movieRating");
        let movieStoryline = movieModal.querySelector("#movieStoryline");

        data.movie.forEach(
          ({
            movies_title,
            movies_year,
            movies_storyline,
            movies_rating,
            movies_cover
          }) => {
            movieTitle.innerHTML = movies_title;
            movieCover.src = `images/${movies_cover}`;
            movieCover.alt = movies_title;
            movieYear.innerHTML = movies_year;
            movieStoryline.innerHTML = movies_storyline;
            movieRating.innerHTML = "Rating: " + movies_rating;
          }
        );
      })
      .catch(function(error) {
        console.log(error);
      });
  }

  function getMovieGenre(movieId) {
    let url = "movie/getGenre/" + movieId;
    fetch(url)
      .then(resp => resp.json())
      .then(data => {
        let movieGenre = movieModal.querySelector("#movieGenre");
        let genres = "";
        data.genre.forEach(({ genre_name }) => {
          genres += `${genre_name}, `;
        });
        genres = genres.replace(/, $/, "");
        movieGenre.innerHTML = genres;
      })
      .catch(function(error) {
        console.log(error);
      });
  }

  function getParentalRatingofMovie(movieId) {
    let url = "movie/getAgeRating/" + movieId;
    fetch(url)
      .then(resp => resp.json())
      .then(data => {
        let moviePG = movieModal.querySelector("#moviePG");
        let rating = '';
        data.agerating.forEach(({ age_rating_name }) => {
          rating = `${age_rating_name}`;
        });
        moviePG.innerHTML = rating;
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
          ".thumbnail-list"
        );
        data.artists.forEach(({ artist_id, artist_name, artist_photo }) => {
          let artistThumbnail = `<div class="card"><img data-id=${artist_id} data-toggle="modal" data-target="#musicModal" src="images/${artist_photo}" alt="${artist_name} cover" class="card-img-top artist-thumbnail"><div class="card-body">
          <h5 class="card-title">${artist_name}</h5></div></div>`;
          artistWrapper.innerHTML += artistThumbnail;
        });
        let artists = artistWrapper.querySelectorAll(".artist-thumbnail");
        artists.forEach(movie => {
          movie.addEventListener("click", getArtistDetails, false);
        });
      })
      .catch(function(error) {
        console.log(error);
      });
  }

  function getArtistDetails(evt) {
    let id = evt.currentTarget.dataset.id;
    getArtistInformation(id);
    //getArtistAlbums(id);
  }

  function getArtistInformation(movieId) {
    let url = "music/getArtist/" + movieId;
    fetch(url)
      .then(resp => resp.json())
      .then(data => {
        let musicModal = document.querySelector("#musicModal");
        let musicModalLabel = musicModal.querySelector("#musicModalLabel");
        let artistPhoto = musicModal.querySelector("#modalPhoto");
        let artistAlbums = musicModal.querySelector("#artistAlbums");

        data.artist.forEach(
          ({
            artist_name,
            artist_photo,
          }) => {
            musicModalLabel.innerHTML = artist_name;
            artistPhoto.src = `images/${artist_photo}`;
          }
        );
      })
      .catch(function(error) {
        console.log(error);
      });
  }

  getMoviePosters.call();
  getArtistPhotos.call();
})();
