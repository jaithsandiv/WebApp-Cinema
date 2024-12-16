function editMovie(id, title, genre, description, imdb_rating, duration, image_Path, release_date, status, actors, characters, director, produce, writer, music) {
    document.getElementById('editMovieId').value = id;
    document.getElementById('editMovieTitle').value = title;
    document.getElementById('editMovieGenre').value = genre;
    document.getElementById('editMovieDescription').value = description;
    document.getElementById('editMovieImdb_Rating').value = imdb_rating;
    document.getElementById('editMovieDuration').value = duration;
    document.getElementById('editMovieRelease_date').value = release_date;
    document.getElementById('editMovieStatus').value = status;
    document.getElementById('editMovieActors').value = actors;
    document.getElementById('editMovieCharacters').value = characters;
    document.getElementById('editMovieDirector').value = director;
    document.getElementById('editMovieProduce').value = produce;
    document.getElementById('editMovieWriter').value = writer;
    document.getElementById('editMovieMusic').value = music;

    // Set current image
    const imageElement = document.getElementById('currentMovieImage');
    imageElement.src = image_Path || './images/placeholder.png';

    // Preview new image when selected
    document.getElementById('editImageInput').addEventListener('change', function (e) {
        if (this.files && this.files[0]) {
            const reader = new FileReader();
            reader.onload = function (e) {
                imageElement.src = e.target.result;
            };
            reader.readAsDataURL(this.files[0]);
        }
    });

    new bootstrap.Modal(document.getElementById('editMovieModal')).show();
}

function deleteMovie(id) {
    document.getElementById('deleteMovieId').value = id;
    new bootstrap.Modal(document.getElementById('deleteMovieModal')).show();
}