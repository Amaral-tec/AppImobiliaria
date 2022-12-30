<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="dao.ConnectionFactory"%>
<%@page import="dao.Config"%>
<%@page import="domain.User"%>
<%@page import="dao.UserDAO"%>


<%
    Statement st = null;
    ResultSet rs = null;

    //check if there is a user registered in the DB
    try {

        st = new ConnectionFactory().initConnection().createStatement();
        rs = st.executeQuery("SELECT * FROM tb_users");

        if (rs.last() == false) {
            //CREATE USER IF IT DOESN'T EXIST
            String email = new Config().email;
            st.executeUpdate("INSERT into tb_users (name, cpf, mobilephone, email, address, number, "
                    + "district, city, state, cep, password, level, image) "
                    + "values "
                    + "('Administrador', '10000000000' , '10000000000', '" + email + "' , 'Test avenue', '1', "
                    + "'test', 'test', 'test', '10000000', '123', '1', 'user.png')");
        }
    } catch (Exception e) {
        out.print(e);
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
<link rel="stylesheet" href="../css/login.css" type="text/css">
<link rel="stylesheet" href="../css/bootstrap.min.css" type="text/css">

<link rel="shortcut icon" href="../img/favicon.ico" type="image/x-icon">
<link rel="icon" href="../img/favicon.ico" type="image/x-icon">

<div class="main">


    <div class="container">
        <center>
            <div class="middle">
                <div id="login">

                    <form method="get">

                        <fieldset class="clearfix">

                            <p ><span class="fa fa-user"></span><input type="email" name="email" Placeholder="Email" required></p>
                            <p><span class="fa fa-lock"></span><input type="password" name="password" Placeholder="Password" required></p>

                            <div>
                                <span style="width:48%; text-align:left;  display: inline-block;"><a class="small-text" href="#">Forgot
                                        password?</a></span>
                                <span style="width:50%; text-align:right;  display: inline-block;"><input type="submit" value="Sign In"></span>
                            </div>

                            <p align="center" class="alert-text mt-2">                                
                                <%                                    
                                    String email = request.getParameter("email");
                                    String password = request.getParameter("password");

                                    if (email == null || password == null) {
                                        out.println("Fill in the Data");
                                    } else {
                                        try {
                                            st = new ConnectionFactory().initConnection().createStatement();
                                            rs = st.executeQuery("SELECT * FROM tb_users where email = '" + email + "' and password = '" + password + "'");

                                            if (rs.next()) {
                                                session.setAttribute("idUser", rs.getInt(1));
                                                session.setAttribute("levelUser", rs.getInt(13));
                                                
                                                response.sendRedirect("panel_admin");
                                                
                                            } else {
                                                out.println("Incorrect Data");
                                            }

                                        } catch (Exception e) {
                                            out.print(e);
                                        }
                                    }
                                %> 
                            </p>

                        </fieldset>
                        <div class="clearfix"></div>
                    </form>

                    <div class="clearfix"></div>

                </div> <!-- end login -->
                <div class="logo">

                    <span class="d-none d-md-block">Estate Agency</Span>

                    <div class="clearfix"></div>
                </div>

            </div>
        </center>
    </div>

</div>