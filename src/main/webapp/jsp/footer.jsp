<body>
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
                        <li><a href="/contact">Contact</a></li>
                    </ul>
                </div>

                <!-- Help & Support -->
                <div class="col-md-2 mb-4 mb-md-0">
                    <h5>HELP & SUPPORT</h5>
                    <ul class="footer-links">
                        <li><a href="/faqs">FAQs</a></li>
                        <li><a href="/terms">Terms of Service</a></li>
                        <li><a href="/privacy">Privacy Policy</a></li>
                        <li><a href="/support">Contact Support</a></li>
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
                <p>? 2024 ABC Cinema. All rights reserved.</p>
            </div>
        </div>
    </footer>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
    <script>
        window.addEventListener('scroll', function() {
            var navbar = document.querySelector('.navbar');
            if (window.scrollY > 50) {
                navbar.classList.add('minimized');
            } else {
                navbar.classList.remove('minimized');
            }
        });
    </script>
</body>


                