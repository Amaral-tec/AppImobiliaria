<jsp:include page="header.jsp" />
<%@page import="dao.Config"%> 
<%
    String email = new Config().email;
    String whatsapp = new Config().whatsapp;
    String mobilePhone = new Config().mobilePhone;
    String whatsappLink = new Config().whatsappLink;
    String address = new Config().address;
%>


<!-- Contact Form Section Begin -->
<section class="contact-form-section spad">
    <div class="container">
        <div class="row">
            <div class="col-lg-12">
                <div class="cf-content">
                    <div class="cc-title">
                        <h4>Get In Touch!</h4>
                        <p>If you are curious to hear more about us and what we can offer, don't hesitate to get in touch. 
                            We try to take care of all of the detailed and long processes and making home buying or selling super easy! 
                            Send us your brief and learn how we work. If you'd like, you can also contact us via Whatsapp 
                            <a class="text-dark" target="_blank" href="http://api.whatsapp.com/send?1=pt_BR&phone=<%=whatsappLink%>"><i class="fa fa-whatsapp mr-1"></i> <%=whatsapp%> </a></p>
                    </div>
                    <form action="#" class="cc-form">
                        <div class="group-input">
                            <input type="text" placeholder="Name">
                            <input id="mobilePhone" type="text" placeholder="Phone Number">
                            <input type="email" placeholder="Email address">

                        </div>
                        <textarea placeholder="Your Message"></textarea>
                        <button type="submit" class="site-btn">Send Message</button>
                    </form>
                </div>
            </div>
        </div>
    </div>
</section>
<!-- Contact Form Section End -->

<!-- Contact Section Begin -->
<section class="contact-section">
    <div class="container">
        <div class="row">
            <div class="col-lg-6">
                <div class="contact-info">
                    <div class="ci-item">
                        <div class="ci-icon">
                            <i class="fa fa-map-marker"></i>
                        </div>
                        <div class="ci-text">
                            <h5>Address</h5>
                            <p><%=address%></p>
                        </div>
                    </div>
                    <div class="ci-item">
                        <div class="ci-icon">
                            <i class="fa fa-mobile"></i>
                        </div>
                        <div class="ci-text">
                            <h5>Phone Number</h5>
                            <ul>
                                <li><a class="text-dark" target="_blank" href="http://api.whatsapp.com/send?1=pt_BR&phone=<%=whatsappLink%>"><i class="fa fa-whatsapp"></i> <%=whatsapp%> </a> </li>
                                <li><%=mobilePhone%></li>
                            </ul>
                        </div>
                    </div>
                    <div class="ci-item">
                        <div class="ci-icon">
                            <i class="fa fa-headphones"></i>
                        </div>
                        <div class="ci-text">
                            <h5>Email Address</h5>
                            <p><%=email%></p>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div class="cs-map">
        <iframe src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d15004.453961620837!2d-43.94841387071271!3d-19.919621785751325!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0xa699e4e119a387%3A0xd00dc0b14abf3fc4!2sCentro%2C%20Belo%20Horizonte%20-%20MG!5e0!3m2!1spt-BR!2sbr!4v1593048428551!5m2!1spt-BR!2sbr" width="600" height="450" frameborder="0" style="border:0;" allowfullscreen="" aria-hidden="false" tabindex="0"></iframe>
    </div>
</section>
<!-- Contact Section End -->

<jsp:include page="baseboard.jsp" />

<jsp:include page="scripts.jsp" />
