<%@page import="dao.Config"%> 
<%
    String email = new Config().email;
    String whatsapp = new Config().whatsapp;
    String mobilePhone = new Config().mobilePhone;
    String whatsappLink = new Config().whatsappLink;
    String address = new Config().address;
%>

<!-- Footer Section Begin -->
<footer class="footer-section">
    <div class="container">
        <div class="row">
            <div class="col-lg-4 col-md-6">
                <div class="fs-about">
                    <div class="fs-logo">
                        <a href="#">
                            <img src="img/logo-b-p.png" alt="">
                        </a>
                    </div>
                    <p><%=address%></p>
                    <div class="fs-social">
                        <a href="https://www.facebook.com/" target="_blank"><i class="fa fa-facebook"></i></a>
                        <a href="https://www.youtube.com/" target="_blank"><i class="fa fa-youtube-play"></i></a>
                        <a href="https://www.instagram.com/" target="_blank"><i class="fa fa-instagram"></i></a>
                        <a target="_blank" href="http://api.whatsapp.com/send?1=pt_BR&phone=<%=whatsappLink%>"> <i class="fa fa-whatsapp"></i></a>
                    </div>
                </div>
            </div>
            <div class="col-lg-2 col-sm-6">        
            </div>
            <div class="col-lg-2 col-sm-6">
                <div class="fs-widget">
                    <h5>Links</h5>
                    <ul>
                        <li><a href="./contact.jsp">Contact</a></li>
                        <li><a href="NiceAdmin">Register</a></li>
                        <li><a href="NiceAdmin">Login</a></li>
                        <li><a href="./blog.jsp">Blog</a></li>
                    </ul>
                </div>
            </div>
            <div class="col-lg-4 col-md-6">
                <div class="fs-widget">
                    <h5>Newsletter</h5>
                    <p>Do you want to receive Real Estate offers?</p>
                    <form action="#" class="subscribe-form">
                        <input type="text" placeholder="Email">
                        <button type="submit" class="site-btn">Connect With Us</button>
                    </form>
                </div>
            </div>
        </div>
        <div class="copyright-text">
            <p></p>
        </div>
    </div>
</footer>
<!-- Footer Section End -->

<!-- Js Plugins -->
<script src="js/jquery-3.3.1.min.js"></script>
<script src="js/bootstrap.min.js"></script>
<script src="js/jquery.magnific-popup.min.js"></script>
<script src="js/mixitup.min.js"></script>
<script src="js/jquery-ui.min.js"></script>
<script src="js/jquery.nice-select.min.js"></script>
<script src="js/jquery.slicknav.js"></script>
<script src="js/owl.carousel.min.js"></script>
<script src="js/jquery.richtext.min.js"></script>
<script src="js/image-uploader.min.js"></script>
<script src="js/main.js"></script>
</body>

</html>