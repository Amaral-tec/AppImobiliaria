<%@page import="java.sql.*"%>
<%@page import="com.mysql.jdbc.Driver"%>
<%@page import="dao.ConnectionFactory"%>

<%
    Statement st = null;
    ResultSet rs = null;
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
<link rel="stylesheet" href="../css/login.css" type="text/css">
<link rel="stylesheet" href="../css/bootstrap.min.css" type="text/css">

<link rel="shortcut icon" href="../img/favicon.ico" type="image/x-icon">
<link rel="icon" href="../img/favicon.ico" type="image/x-icon">

<div class="main">


    <div class="container">
        <center>
            <div class="middle">
                <div id="login">

                    <form action="javascript:void(0);" method="get">

                        <fieldset class="clearfix">

                            <p ><span class="fa fa-user"></span><input type="email" name="email" Placeholder="Email" required></p> <!-- JS because of IE support; better: placeholder="Username" -->
                            <p><span class="fa fa-lock"></span><input type="password" name="senha" Placeholder="Senha" required></p> <!-- JS because of IE support; better: placeholder="Password" -->

                            <div>
                                <span style="width:48%; text-align:left;  display: inline-block;"><a class="small-text" href="#">Recuperar Senha</a></span>
                                <span style="width:50%; text-align:right;  display: inline-block;"><input type="submit" value="Logar"></span>
                            </div>

                            <p align="center" class="texto-alerta mt-2">
                                <%
                                    String email = request.getParameter("email");
                                    String senha = request.getParameter("senha");
                                    String nomeUsuario = "";
                                    String cpfUsuario = "";

                                    String user = "", pass = "";
                                    int i = 0;

                                    try {

                                        st = new ConnectionFactory().conectar().createStatement();
                                        rs = st.executeQuery("SELECT * FROM usuarios where email = '" + email + "' and senha = '" + senha + "'");
                                        while (rs.next()) {
                                            user = rs.getString(4);
                                            pass = rs.getString(5);
                                            nomeUsuario = rs.getString(2);
                                            cpfUsuario = rs.getString(3);
                                            rs.last();
                                            i = rs.getRow();
                                        }
                                    } catch (Exception e) {
                                        out.print(e);
                                    }

                                    if (email == null || senha == null) {
                                        out.println("Preencha os Dados");

                                    } else {

                                        if (i > 0) {
                                            session.setAttribute("nomeUsuario", nomeUsuario);
                                            session.setAttribute("cpfUsuario", cpfUsuario);
                                            response.sendRedirect("../index.jsp");
                                        } else {
                                            out.println("Dados Incorretos");
                                        }
                                    }
                                %> 
                            </p>

                        </fieldset>
                        <div class="clearfix"></div>
                    </form>
                    <div class="clearfix"></div>
                </div> <!-- end login -->
                <div class="logo">IMOB
                    <div class="clearfix"></div>
                </div>
            </div>
        </center>
    </div>
</div>