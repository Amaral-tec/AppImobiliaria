<jsp:include page="header.jsp" />

<!-- Hero Section Begin -->
<section class="hero-section">
    <div class="container">
        <div class="hs-slider owl-carousel">
            <div class="hs-item set-bg" data-setbg="img/hero/hero-1.jpg">
                <div class="row">
                    <div class="col-lg-12">
                        <div class="hc-inner-text">
                            <div class="hc-text">
                                <h4>Residencial Thisaliah</h4>
                                <p><span class="icon_pin_alt"></span> Natal, Rio Grande do Norte</p>
                                <div class="label">For Rent</div>
                                <h5>R$ 750,00<span>/month</span></h5>
                            </div>
                            <div class="hc-widget">
                                <ul>
                                    <li><i class="fa fa-object-group"></i> 62m?</li>
                                    <li><i class="fa fa-bathtub"></i> 02</li>
                                    <li><i class="fa fa-bed"></i> 02</li>
                                    <li><i class="fa fa-automobile"></i> 01</li>
                                </ul>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="hs-item set-bg" data-setbg="img/hero/hero-2.jpg">
                <div class="row">
                    <div class="col-lg-12">
                        <div class="hc-inner-text">
                            <div class="hc-text">
                                <h4>Balaji Symphony</h4>
                                <p><span class="icon_pin_alt"></span> Panvel, Navi Mumbai</p>
                                <div class="label">For Sale</div>
                                <h5>$ 65.0<span>/month</span></h5>
                            </div>
                            <div class="hc-widget">
                                <ul>
                                    <li><i class="fa fa-object-group"></i> 2, 283</li>
                                    <li><i class="fa fa-bathtub"></i> 03</li>
                                    <li><i class="fa fa-bed"></i> 05</li>
                                    <li><i class="fa fa-automobile"></i> 01</li>
                                </ul>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="hs-item set-bg" data-setbg="img/hero/hero-3.jpg">
                <div class="row">
                    <div class="col-lg-12">
                        <div class="hc-inner-text">
                            <div class="hc-text">
                                <h4>Balaji Symphony</h4>
                                <p><span class="icon_pin_alt"></span> Panvel, Navi Mumbai</p>
                                <div class="label">For Rent</div>
                                <h5>$ 65.0<span>/month</span></h5>
                            </div>
                            <div class="hc-widget">
                                <ul>
                                    <li><i class="fa fa-object-group"></i> 2, 283</li>
                                    <li><i class="fa fa-bathtub"></i> 03</li>
                                    <li><i class="fa fa-bed"></i> 05</li>
                                    <li><i class="fa fa-automobile"></i> 01</li>
                                </ul>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>
<!-- Hero Section End -->

<jsp:include page="search.jsp" />

<!-- Property Section Begin -->
<section class="property-section latest-property-section spad">
    <div class="container">
        <div class="row">
            <div class="col-lg-5">
                <div class="section-title">
                    <h4>Latest PROPERTY</h4>
                </div>
            </div>
            <div class="col-lg-7">
                <div class="property-controls">
                    <ul>
                        <li id="listarTodos" data-filter="all">All</li>
                        <li data-filter=".apart">Apartment</li>
                        <li data-filter=".house">House</li>
                        <li data-filter=".office">Office</li>
                        <li data-filter=".ground">Ground</li>
                    </ul>
                </div>
            </div>
        </div>

        <!-- Beginning of cards with Real Estate --> 

        <jsp:include page="profile.jsp" /> 

        <!-- End of cards with Real Estate -->    
    </div>
</div>
</section>
<!-- Property Section End -->

<!-- Chooseus Section Begin -->
<section class="chooseus-section spad set-bg" data-setbg="img/chooseus/chooseus-bg.jpg">
    <div class="container">
        <div class="row">
            <div class="col-lg-8">
                <div class="chooseus-text">
                    <div class="section-title">
                        <h4>Why choose us</h4>
                    </div>
                    <p>Our website features the best real estate search for homes, condos, 
                        land and foreclosure properties available. It is the only site you will ever need!</p>
                    <p>You can save searches, and get daily email alerts of new listings, price changes, sold data, 
                        and market reports. Our Interactive Map Search allows you to view properties on a map or refine 
                        your search by drawing the boundaries around the area you desire.</p>
                </div>
                <div class="chooseus-features">
                    <div class="cf-item">
                        <div class="cf-pic">
                            <img src="img/chooseus/chooseus-icon-1.png" alt="">
                        </div>
                        <div class="cf-text">
                            <h5>Find your future home</h5>
                            <p>We help you find a new home by offering a smart real estate.</p>
                        </div>
                    </div>
                    <div class="cf-item">
                        <div class="cf-pic">
                            <img src="img/chooseus/chooseus-icon-2.png" alt="">
                        </div>
                        <div class="cf-text">
                            <h5>Buy or rent homes</h5>
                            <p>Various houses and apartments in your favorite cities</p>
                        </div>
                    </div>
                    <div class="cf-item">
                        <div class="cf-pic">
                            <img src="img/chooseus/chooseus-icon-3.png" alt="">
                        </div>
                        <div class="cf-text">
                            <h5>Experienced agents</h5>
                            <p>Find an agent who knows your market best</p>
                        </div>
                    </div>
                    <div class="cf-item">
                        <div class="cf-pic">
                            <img src="img/chooseus/chooseus-icon-4.png" alt="">
                        </div>
                        <div class="cf-text">
                            <h5>List your own property</h5>
                            <p>Sign up now and sell or rent your own properties</p>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>
<!-- Chooseus Section End -->

<!-- Feature Property Section Begin -->
<section class="feature-property-section spad">
    <div class="container">
        <div class="row">
            <div class="col-lg-4 p-0">
                <div class="feature-property-left">
                    <div class="section-title">
                        <h4>Categories</h4>
                    </div>
                    <ul>
                        <li>Apartment</li>
                        <li>House</li>
                        <li>Office</li>
                        <li>Ground</li>
                    </ul>
                    <a href="property.jsp">All</a>
                </div>
            </div>
            <div class="col-lg-8 p-0">
                <div class="fp-slider owl-carousel">

                    <!-- Inicio do Carrousel -->
                    <div class="fp-item set-bg" data-setbg="img/feature-property/fp-1.jpg">
                        <div class="fp-text">
                            <h5 class="title">Residencial Thisaliah</h5>
                            <p><span class="icon_pin_alt"></span> Natal, Rio Grande do Norte</p>
                            <div class="label">Para Alugar</div>
                            <h5>R$ 750,00<span>/m?s</span></h5>
                            <ul>
                                <li><i class="fa fa-object-group"></i> 62m?</li>
                                <li><i class="fa fa-bathtub"></i> 02</li>
                                <li><i class="fa fa-bed"></i> 02</li>
                                <li><i class="fa fa-automobile"></i> 01</li>
                            </ul>
                        </div>
                    </div>
                    <div class="fp-item set-bg" data-setbg="img/feature-property/fp-2.jpg">
                        <div class="fp-text">
                            <h5 class="title">Residencial Thisaliah</h5>
                            <p><span class="icon_pin_alt"></span> Natal, Rio Grande do Norte</p>
                            <div class="label">Para Alugar</div>
                            <h5>R$ 750,00<span>/m?s</span></h5>
                            <ul>
                                <li><i class="fa fa-object-group"></i> 62m?</li>
                                <li><i class="fa fa-bathtub"></i> 02</li>
                                <li><i class="fa fa-bed"></i> 02</li>
                                <li><i class="fa fa-automobile"></i> 01</li>
                            </ul>
                        </div>
                    </div>               
                    <!-- Final do Carrousel -->

                </div>
            </div>
        </div>
    </div>
</section>
<!-- Feature Property Section End -->

<!-- Team Section Begin -->
<section class="team-section spad">
    <div class="container">
        <div class="row">
            <div class="col-lg-8 col-md-8">
                <div class="section-title">
                    <h4>Our Agents</h4>
                </div>
            </div>
            <div class="col-lg-4 col-md-4">
                <div class="team-btn">
                    <a href="#"><i class="fa fa-user"></i>All</a>
                </div>
            </div>
        </div>
        <div class="row">
            <div class="col-md-4">
                <div class="ts-item">
                    <div class="ts-text">
                        <img src="img/team/team-1.png" alt="">
                        <h5>Joarlla Medeiros</h5>
                        <span>(31) 97527-5084</span>
                        <p>Ipsum dolor amet, consectetur adipiscing elit, eiusmod tempor incididunt lorem.</p>
                        <div class="ts-social">
                            <a href="#"><i class="fa fa-facebook"></i></a>
                            <a href="#"><i class="fa fa-twitter"></i></a>
                            <a href="#"><i class="fa fa-envelope-o"></i></a>
                            <a target="_blank" href="http://api.whatsapp.com/send?1=pt_BR&phone=5531975275084"><i class="fa fa-whatsapp"></i></a>
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-md-4">
                <div class="ts-item">
                    <div class="ts-text">
                        <img src="img/team/team-2.png" alt="">
                        <h5>Leandro Amaral</h5>
                        <span>(84) 99109-2984</span>
                        <p>Ipsum dolor amet, consectetur adipiscing elit, eiusmod tempor incididunt lorem.</p>
                        <div class="ts-social">
                            <a href="#"><i class="fa fa-facebook"></i></a>
                            <a href="#"><i class="fa fa-twitter"></i></a>
                            <a href="#"><i class="fa fa-envelope-o"></i></a>
                            <a target="_blank" href="http://api.whatsapp.com/send?1=pt_BR&phone=5531975275084"><i class="fa fa-whatsapp"></i></a>
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-md-4">
                <div class="ts-item">
                    <div class="ts-text">
                        <img src="img/team/team-3.jpg" alt="">
                        <h5>Ashton Kutcher</h5>
                        <span>123-455-688</span>
                        <p>Ipsum dolor amet, consectetur adipiscing elit, eiusmod tempor incididunt lorem.</p>
                        <div class="ts-social">
                            <a href="#"><i class="fa fa-facebook"></i></a>
                            <a href="#"><i class="fa fa-twitter"></i></a>
                            <a href="#"><i class="fa fa-envelope-o"></i></a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>
<!-- Team Section End -->

<!-- Categories Section Begin -->
<section class="categories-section">
    <div class="cs-item-list">
        <div class="cs-item set-bg" data-setbg="img/categories/cat-1.jpg">
            <div class="cs-text">
                <h5>Apartment</h5>
                <span>230 property</span>
            </div>
        </div>
        <div class="cs-item set-bg" data-setbg="img/categories/cat-2.jpg">
            <div class="cs-text">
                <h5>House</h5>
                <span>230 property</span>
            </div>
        </div>
        <div class="cs-item set-bg" data-setbg="img/categories/cat-3.jpg">
            <div class="cs-text">
                <h5>Office</h5>
                <span>230 property</span>
            </div>
        </div>
        <div class="cs-item set-bg" data-setbg="img/categories/cat-4.jpg">
            <div class="cs-text">
                <h5>Ground</h5>
                <span>230 property</span>
            </div>
        </div>
        <div class="cs-item set-bg" data-setbg="img/categories/cat-5.jpg">
            <div class="cs-text">
                <h5>Others</h5>
                <span>230 property</span>
            </div>
        </div>
    </div>
</section>
<!-- Categories Section End -->

<jsp:include page="testimonial.jsp" />

<jsp:include page="baseboard.jsp" />

<jsp:include page="modal.jsp" />

<jsp:include page="scripts.jsp" />