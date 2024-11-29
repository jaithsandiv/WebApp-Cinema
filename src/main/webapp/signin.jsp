<!DOCTYPE html>
<html lang="en">
    <head>
        <title>ABC CINEMA</title>
        <link rel="icon" href="images/logotab.png">
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" href="css/registration.css">
        <%@ include file="jsp/header.jsp"%>
    </head>
    <body>
        <div class="banner">
    <h1>Welcome to ABC Cinemas</h1>
    <p>Immerse yourself in the world of cinema. Where stories come to life, and the impossible becomes real.</p>
</div>
    
<div class="login-container">
     <div class="container">
         <h2>Sign in</h2>
            
         <!--<button class="google-btn">
              <img src="data:image/svg+xml;base64,PHN2ZyB3aWR0aD0iMjQiIGhlaWdodD0iMjQiIHZpZXdCb3g9IjAgMCAyNCAyNCIgeG1sbnM9Imh0dHA6Ly93d3cudzMub3JnLzIwMDAvc3ZnIj48cGF0aCBkPSJNMjIuNTYgMTIuMjVjMC0uNzgtLjA3LTEuNTMtLjItMi4yNUgxMnYzLjI2aDUuOTJjLS4yNiAxLjM3LTEuMDQgMi41My0yLjIxIDMuMzF2Mi43N2gzLjU3YzIuMDgtMS45MiAzLjI4LTQuNzQgMy4yOC04LjA5eiIgZmlsbD0iIzQyODVmNCIvPjxwYXRoIGQ9Ik0xMiAyM2MyLjk3IDAgNS40Ni0uOTggNy4yOC0yLjY2bC0zLjU3LTIuNzdjLTEuMDEuNjgtMi4yOSAxLjA4LTMuNzEgMS4wOC0yLjg1IDAtNS4yNy0xLjkzLTYuMTQtNC41MUgxLjc0djIuODdDMy41MSAyMC40NSA3LjM2IDIzIDEyIDIzeiIgZmlsbD0iIzM0YTg1MyIvPjxwYXRoIGQ9Ik01Ljg2IDE0LjE0YTYuNTIgNi41MiAwIDAgMS0uMzQtMi4xNGMwLS43My4xMi0xLjQ1LjM0LTIuMTRWNy4wMUgxLjc0QTExIDExIDAgMCAwIDEgMTJjMCAxLjczLjQgMy4zNyAxLjA3IDQuODZsNC4xMy0yLjcyeiIgZmlsbD0iI2ZiYmMwNSIvPjxwYXRoIGQ9Ik0xMiA1LjM1YzEuNjEgMCAzLjA2LjU1IDQuMiAxLjY0bDMuMTctMy4xN0MxNy40NSAyLjA5IDE0Ljk3IDEgMTIgMSA3LjM2IDEgMy41MSAzLjU1IDEuNzQgNy4wMWw0LjEyIDIuNzJDNi43MyA3LjE1IDkuMTUgNS4zNSAxMiA1LjM1eiIgZmlsbD0iI2VhNDMzNSIvPjwvc3ZnPg==" alt="Google logo" width="24" height="24">
              Sign in with Google
         </button>

         <div class="divider">or sign in with email</div>-->

        <form>
              <div class="form-group">
                   <label for="email">Email</label>
                   <input type="email" id="email" required>
             </div>

             <div class="form-group">
                 <div class="password-header">
                     <label for="password">Password</label>
                     <!--<a href="#" class="forgot-link">Forgot?</a>-->
                </div>
                <div class="input-wrapper">
                     <input type="password" id="password" required>
                    <button type="button" class="password-toggle" aria-label="Toggle password visibility">
                        <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24">
                            <path d="M12 4.5C7 4.5 2.73 7.61 1 12c1.73 4.39 6 7.5 11 7.5s9.27-3.11 11-7.5c-1.73-4.39-6-7.5-11-7.5zM12 17c-2.76 0-5-2.24-5-5s2.24-5 5-5 5 2.24 5 5-2.24 5-5 5zm0-8c-1.66 0-3 1.34-3 3s1.34 3 3 3 3-1.34 3-3-1.34-3-3-3z"/>
                        </svg>
                    </button>
                </div>
            </div>

            <button type="submit" class="sign-in-btn">Sign In</button>
        </form>

        <p class="signup-text">
            Don't have an account? <a href="#" class="signup-link">Sign up</a>
        </p>
    </div>
</div>
    </body>
    <%@ include file="jsp/footer.jsp"%>
    <script>
        document.querySelector('.password-toggle').addEventListener('click', function () {
            const passwordInput = document.getElementById('password');
            if (!passwordInput) {
            console.error('Password input field not found.');
            return;
        }

        // Toggle password visibility
        const isPassword = passwordInput.getAttribute('type') === 'password';
        passwordInput.setAttribute('type', isPassword ? 'text' : 'password');

        // Change the icon inside the button
        this.innerHTML = isPassword
        ? '<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" width="24" height="24"><path d="M12 4.5C7 4.5 2.73 7.61 1 12c1.73 4.39 6 7.5 11 7.5s9.27-3.11 11-7.5c-1.73-4.39-6-7.5-11-7.5zM12 17c-2.76 0-5-2.24-5-5s2.24-5 5-5 5 2.24 5 5-2.24 5-5 5zm0-8c-1.66 0-3 1.34-3 3s1.34 3 3 3 3-1.34 3-3-1.34-3-3-3z"/></svg>'
        : '<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" width="24" height="24"><path d="M12 7c2.76 0 5 2.24 5 5 0 .65-.13 1.26-.36 1.83l2.92 2.92c1.51-1.26 2.7-2.89 3.43-4.75-1.73-4.39-6-7.5-11-7.5-1.4 0-2.74.25-3.98.7l2.16 2.16C10.74 7.13 11.35 7 12 7zM2 4.27l2.28 2.28.46.46C3.08 8.3 1.78 10.02 1 12c1.73 4.39 6 7.5 11 7.5 1.55 0 3.03-.3 4.38-.84l.42.42L19.73 22 21 20.73 3.27 3 2 4.27zM7.53 9.8l1.55 1.55c-.05.21-.08.43-.08.65 0 1.66 1.34 3 3 3 .22 0 .44-.03.65-.08l1.55 1.55c-.67.33-1.41.53-2.2.53-2.76 0-5-2.24-5-5 0-.79.2-1.53.53-2.2zm4.31-.78l3.15 3.15.02-.16c0-1.66-1.34-3-3-3l-.17.01z"/></svg>';
        });
    </script>
</html>