document.addEventListener('DOMContentLoaded', function () {
    const togglePassword = document.querySelector('#togglePassword');
    const password = document.querySelector('#password');

    function togglePasswordVisibility(inputField, toggleButton) {
        const type = inputField.getAttribute('type') === 'password' ? 'text' : 'password';
        inputField.setAttribute('type', type);
        toggleButton.querySelector('i').classList.toggle('bi-eye');
        toggleButton.querySelector('i').classList.toggle('bi-eye-slash');
    }

    togglePassword.addEventListener('click', function () {
        togglePasswordVisibility(password, this);
    });
});