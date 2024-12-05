document.addEventListener('DOMContentLoaded', function () {
    const togglePassword = document.querySelector('#togglePassword');
    const toggleConfirmPassword = document.querySelector('#toggleConfirmPassword');
    const password = document.querySelector('#password');
    const confirmPassword = document.querySelector('#confirmPassword');

    function togglePasswordVisibility(inputField, toggleButton) {
        const type = inputField.getAttribute('type') === 'password' ? 'text' : 'password';
        inputField.setAttribute('type', type);
        toggleButton.querySelector('i').classList.toggle('bi-eye');
        toggleButton.querySelector('i').classList.toggle('bi-eye-slash');
    }

    togglePassword.addEventListener('click', function () {
        togglePasswordVisibility(password, this);
    });

    toggleConfirmPassword.addEventListener('click', function () {
        togglePasswordVisibility(confirmPassword, this);
    });
});