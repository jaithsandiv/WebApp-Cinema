document.addEventListener('DOMContentLoaded', function() {
    // Handle user info form
    const userInfoForm = document.getElementById('userInfoForm');
    const passwordForm = document.getElementById('passwordForm');
    
    if (userInfoForm) {
        userInfoForm.addEventListener('submit', function(event) {
            if (!this.checkValidity()) {
                event.preventDefault();
                event.stopPropagation();
            }
            this.classList.add('was-validated');
        });
    }
    
    if (passwordForm) {
        passwordForm.addEventListener('submit', function(event) {
            if (!this.checkValidity()) {
                event.preventDefault();
                event.stopPropagation();
            }
            
            const newPassword = document.getElementById('newPassword');
            const currentPassword = document.getElementById('currentPassword');
            
            if (newPassword.value && !currentPassword.value) {
                event.preventDefault();
                currentPassword.setCustomValidity('Current password is required to set new password');
            } else {
                currentPassword.setCustomValidity('');
            }
            
            this.classList.add('was-validated');
        });
    }
});
