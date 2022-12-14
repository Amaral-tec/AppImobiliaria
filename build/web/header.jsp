<!DOCTYPE html>
<%@page import="dao.Config"%> 
<%

    String email = new Config().email;
    String whatsapp = new Config().whatsapp;
    String mobilePhone = new Config().mobilePhone;
    String whatsappLink = new Config().whatsappLink;
%>

<html lang="en">

    <head>
        <meta charset="UTF-8">
        <meta name="description" content="Search all area real estate for sale on one easy-to-use site. 
              Including homes, condos, townhomes, land, and foreclosure properties for sale.">
        <meta name="keywords" content="Real estate, properties, rent">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta http-equiv="X-UA-Compatible" content="ie=edge">
        <title>Estate Agency</title>

        <link href="https://fonts.googleapis.com/css?family=Montserrat:300,400,500,600,700,800,900&display=swap"
              rel="stylesheet">
        <link href="https://fonts.googleapis.com/css?family=Lato:400,700,900&display=swap" rel="stylesheet">
        <link rel="stylesheet" href="css/bootstrap.min.css" type="text/css">
        <link rel="stylesheet" href="css/font-awesome.min.css" type="text/css">
        <link rel="stylesheet" href="css/elegant-icons.css" type="text/css">
        <link rel="stylesheet" href="css/jquery-ui.min.css" type="text/css">
        <link rel="stylesheet" href="css/nice-select.css" type="text/css">
        <link rel="stylesheet" href="css/owl.carousel.min.css" type="text/css">
        <link rel="stylesheet" href="css/magnific-popup.css" type="text/css">
        <link rel="stylesheet" href="css/slicknav.min.css" type="text/css">
        <link rel="stylesheet" href="css/style.css" type="text/css">

        <link rel="shortcut icon" href="img/favicon.ico" type="image/x-icon">
        <link rel="icon" href="img/favicon.ico" type="image/x-icon">

    </head>

    <body>
        <!-- Page Preloder -->
        <div id="preloder">
            <div class="loader"></div>
        </div>

        <!-- Offcanvas Menu Wrapper Begin -->
        <div class="offcanvas-menu-overlay"></div>
        <div class="offcanvas-menu-wrapper">
            <div class="canvas-close">
                <span class="icon_close"></span>
            </div>
            <div class="logo">
                <a href="./index.jsp">
                    <img src="img/logo.png" alt="">
                </a>
            </div>
            <div id="mobile-menu-wrap"></div>
            <div class="om-widget">
                <ul>
                    <li><i class="icon_mail_alt"></i> <%=email%></li>
                    <li><a class="text-dark" target="_blank" href="http://api.whatsapp.com/send?1=pt_BR&phone=<%=whatsappLink%>"><i class="fa fa-whatsapp"></i> <%=whatsapp%> </a>
                </ul>
                <a href="property.jsp" class="hw-btn">Properties</a>

            </div>
            <div class="om-social">
                <a href="https://www.facebook.com/" target="_blank"><i class="fa fa-facebook"></i></a>
                <a href="https://www.youtube.com/" target="_blank"><i class="fa fa-youtube-play"></i></a>
                <a href="https://www.instagram.com/" target="_blank"><i class="fa fa-instagram"></i></a>
            </div>
        </div>
        <!-- Offcanvas Menu Wrapper End -->

        <!-- Header Section Begin -->
        <header class="header-section">
            <span class="btn-logar"><a href="system" target="_blank" class="text-secondary"><i class="fa fa-unlock d-none d-md-block"></a></i></span>
            <span class="btn-logar-mobile"><a href="system" target="_blank" class="text-secondary"><i class="fa fa-unlock d-block d-sm-none"></a></i></span>
            <div class="hs-top">
                <div class="container">
                    <div class="row">
                        <div class="col-lg-2">
                            <div class="logo">
                                <a href="./index.jsp"><img src="img/logo.png" alt=""></a>
                            </div>
                        </div>
                        <div class="col-lg-10">
                            <div class="ht-widget">
                                <ul>
                                    <li><i class="icon_mail_alt"></i> <%=email%></li>
                                    <li><a class="text-dark" target="_blank" href="http://api.whatsapp.com/send?1=pt_BR&phone=<%=whatsappLink%>"><i class="fa fa-whatsapp"></i> <%=whatsapp%> </a>
                                </ul>
                                <a href="property.jsp" class="hw-btn">Properties</a>

                            </div>
                        </div>
                    </div>
                    <div class="canvas-open">
                        <span class="icon_menu"></span>
                    </div>
                </div>
            </div>
            <div class="hs-nav">
                <div class="container">
                    <div class="row">
                        <div class="col-lg-9">
                            <nav class="nav-menu">
                                <ul>
                                    <li><a href="./index.jsp">Home</a></li>
                                    <li><a href="property.jsp">Properties</a>
                                        <ul class="dropdown">
                                            <li><a href="./property.jsp">Property List</a></li>
                                            <li><a href="./property-submit.jsp">Property Submit</a></li>
                                        </ul>
                                    </li>
                                    <li><a href="./agents.jsp">Agents</a></li>
                                    <li><a href="./about.jsp">About</a></li>
                                    <li><a href="./blog.jsp">Blog</a></li>
                                    <li><a href="./contact.jsp">Contact</a></li>
                                </ul>
                            </nav>
                        </div>
                        <div class="col-lg-3">
                            <div class="hn-social">
                                <a href="https://www.facebook.com/" target="_blank"><i class="fa fa-facebook"></i></a>
                                <a href="https://www.youtube.com/" target="_blank"><i class="fa fa-youtube-play"></i></a>
                                <a href="https://www.instagram.com/" target="_blank"><i class="fa fa-instagram"></i></a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </header>
        <!-- Header End -->