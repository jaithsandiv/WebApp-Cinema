function editTheatre(id, name, location, imagePath) {
    document.getElementById('editTheatreId').value = id;
    document.getElementById('editTheatreName').value = name;
    document.getElementById('editTheatreLocation').value = location;

    // Set current image
    const imageElement = document.getElementById('currentTheatreImage');
    imageElement.src = imagePath || './images/placeholder.png';

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

    new bootstrap.Modal(document.getElementById('editTheatreModal')).show();
}

function deleteTheatre(id) {
    document.getElementById('deleteTheatreId').value = id;
    new bootstrap.Modal(document.getElementById('deleteTheatreModal')).show();
}