</main>
<footer class="footer">
    <div class="container">
        <div class="row">
            <!-- Logo and Description -->
            <div class="col-md-6 mb-4 mb-md-0">
                <a class="navbar-brand fs-4" href="#">
                    <img src="images/logo.png" alt="" width="200">
                </a>
                <p class="footer-description">Immerse yourself in the world of cinema. Where stories come to life, and the impossible becomes real.</p>
                <div class="social-icons">
                    <a href="https://www.facebook.com/"><img src="./images/facebook.png" alt="Facebook"></a>
                    <a href="https://www.x.com/"><img src="./images/x.png" alt="X"></a>
                    <a href="https://www.instagram.com/"><img src="./images/instagram.png" alt="Instagram"></a>
                    <a href="https://www.tiktok.com/"><img src="./images/tiktok.png" alt="Tiktok"></a>
                </div>
            </div>

            <!-- Quick Links -->
            <div class="col-md-2 mb-4 mb-md-0">
                <h5>QUICK LINKS</h5>
                <ul class="footer-links">
                    <li><a href="/movies">Movies</a></li>
                    <li><a href="/schedule">Schedule</a></li>
                    <li><a href="/theatres">Theatres</a></li>
                </ul>
            </div>

            <!-- Help & Support -->
            <div class="col-md-2 mb-4 mb-md-0">
                <h5>HELP & SUPPORT</h5>
                <ul class="footer-links">
                    <li><a href="tconditions.jsp">Terms and Conditions</a></li>
                    <li><a href="disclaimer.jsp">Disclaimer</a></li>
                    <li><a href="feedback.jsp">Customer Feedback</a></li>
                </ul>
            </div>

            <!-- Contact Info -->
            <div class="col-md-2">
                <h5>CONTACT INFO</h5>
                <div class="contact-info">
                    <p>123 Cinema Street</p>
                    <p>Movie City, MC 12345</p>
                    <p>Phone: (123) 456-7890</p>
                    <p>Email: info@abccinema.com</p>
                </div>
            </div>
        </div>
        <!-- Footer Bottom -->
        <div class="footer-bottom text-center">
            <p>&copy; 2024 ABC Cinema. All rights reserved.</p>
        </div>
    </div>
</footer>
<!-- Navbar JS-->
<script>
    window.addEventListener('scroll', function () {
        var navbar = document.querySelector('.navbar');
        if (window.scrollY > 50) {
            navbar.classList.add('minimized');
        } else {
            navbar.classList.remove('minimized');
        }
    });
</script>
<!-- Bootstrap JS -->

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
<script src="https://code.jquery.com/jquery-3.4.1.slim.min.js" integrity="sha384-J6qa4849blE2+poT4WnyKhv5vZF5SrPo0iEjwBvKU7imGFAV0wwj1yYfoRSJoZ+n" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js" integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6" crossorigin="anonymous"></script>
<script src="js/common.js"></script>
<!-- Allows page specific JS -->
<c:if test="${not empty param.js}">
    <script src="js/${param.js}"></script>
</c:if>
</body>


