<%@page import="java.sql.*"%>
<%@page import="com.mysql.jdbc.Driver"%>
<%@page import="dao.*"%> 
<%@page import="domain.*"%> 


<%
    UserDAO userDAO = new UserDAO();

    userDAO.criarUsuarioAdmin();

    if (request.getContentLength() > 0) {
        User usuarioLogado = userDAO.login(request.getParameter("email"), request.getParameter("password"));
        if (usuarioLogado == null) {
            // Usu�rio ou senha inv�lida
        } else {
            session.setAttribute("nameUser", usuarioLogado.getName());
            session.setAttribute("cpfUser", usuarioLogado.getCpf());
            session.setAttribute("fotoUsuario", usuarioLogado.getPhoto());
            session.setAttribute("idUsuario", usuarioLogado.getId());

            response.sendRedirect("dashboard");

            //verificar permiss�o
            if (usuarioLogado.getEmail() == Config.email) {
                response.sendRedirect("painel-admin");
            }
        }
    }

%>

<link href="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<script src="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"></script>
<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<!------ Include the above in your HEAD tag ---------->

<link href="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<script src="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/js/bootstrap.min.js"></script>
<script src="//code.jquery.com/jquery-1.11.1.min.js"></script>
<!-- Include the above in your HEAD tag -->

<link rel="stylesheet" href="//maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css">
<link rel="stylesheet" href="css/login.css" type="text/css">
<link rel="stylesheet" href="../css/bootstrap.min.css" type="text/css">

<link rel="shortcut icon" href="../img/favicon.ico" type="image/x-icon">
<link rel="icon" href="../img/favicon.ico" type="image/x-icon">
<div class="main">

    <div class="container">
        <center>
            <div class="middle">
                <div id="login">

                    <form action="" method="post">

                        <fieldset class="clearfix">

                            <p ><span class="fa fa-user"></span><input type="email" name="email" Placeholder="Email" required></p> <!-- JS because of IE support; better: placeholder="Username" -->
                            <p><span class="fa fa-lock"></span><input type="password" name="senha" Placeholder="Senha" required></p> <!-- JS because of IE support; better: placeholder="Password" -->

                            <div>
                                <span style="width:48%; text-align:left;  display: inline-block;"><a class="small-text" href="#">Recuperar
                                        Senha?</a></span>
                                <span style="width:50%; text-align:right;  display: inline-block;"><input type="submit" value="Logar"></span>
                            </div>

                            <p align="center" class="texto-alerta mt-2">                                
                                <%  /*
                                    String email = request.getParameter("email");
                                    String password = request.getParameter("password");
                                    String nameUser = "";
                                    String cpfUser = "";
                                    String mobilephoneUser = "";
                                    String addressUser = "";
                                    String numberUser = "";
                                    String districtUser = "";
                                    String cityUser = "";
                                    String stateUser = "";
                                    String cepUser = "";
                                    String passwordUser = "";
                                    String photoUser = "";

                                    String user = "", pass = "";
                                    int i = 0;
                                    try {
                                        connection = ConnectionFactory.getConnection();
                                        rs = st.executeQuery("SELECT * FROM tb_usuarios where email = '" + email + "' and password = '" + password + "'");
                                        while (rs.next()) {
                                            user = rs.getString(5);
                                            pass = rs.getString(12);
                                            nameUser = rs.getString(2);
                                            cpfUser = rs.getString(3);
                                            mobilephoneUser = rs.getString(4);
                                            photoUser = rs.getString(13);
                                            addressUser = rs.getString(6);
                                            numberUser = rs.getString(7);
                                            districtUser = rs.getString(8);
                                            cityUser = rs.getString(9);
                                            stateUser = rs.getString(10);
                                            cepUser = rs.getString(11);
                                            passwordUser = rs.getString(12);
                                            idUser = rs.getString(1);
                                            rs.last();
                                            i = rs.getRow();
                                        }
                                    } catch (Exception e) {
                                        out.print(e);
                                    }
                                    if (email == null || password == null) {
                                        out.println("Preencha os Dados");
                                    } else {
                                        if (i > 0) {
                                            session.setAttribute("nameUser", nameUser);
                                            session.setAttribute("cpfUser", cpfUser);
                                            session.setAttribute("fotoUsuario", photoUser);
                                            session.setAttribute("idUsuario", idUsuario);
                                            if (nivelUsuario.equals("admin")) {
                                                response.sendRedirect("painel-admin");
                                            }
                                            if (nivelUsuario.equals("corretor")) {
                                                response.sendRedirect("painel-corretor");
                                            }
                                            if (nivelUsuario.equals("tesoureiro")) {
                                                response.sendRedirect("painel-tesouraria");
                                            }
                                        } else {
                                            out.println("Dados Incorretos");
                                        }
                                    }
                                     */
                                %> 
                            </p>

                        </fieldset>
                        <div class="clearfix"></div>
                    </form>

                    <div class="clearfix"></div>

                </div> <!-- end login -->
                <div class="logo">

                    <span class="d-none d-md-block">IMOB</span>

                    <div class="clearfix"></div>
                </div>

            </div>
        </center>
    </div>
</div>

