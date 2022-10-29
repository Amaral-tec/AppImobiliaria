<%@page import="java.sql.*"%>
<%@page import="com.mysql.jdbc.Driver"%>
<%@page import="util.*"%> 


<%    Statement st = null;
    ResultSet rs = null;

    //verificar se existe usuário cadastrado no BD
    try {

        st = new Conexao().conectar().createStatement();
        rs = st.executeQuery("SELECT * FROM usuarios");
            
            if(rs.last() == false){
                //CRIAR O USUÁRIO CASO NÃO EXISTA
                String email = new Config().email;
                st.executeUpdate("INSERT into usuarios (nome, cpf, email, senha, nivel, foto) values ('Administrador', '000.000.000-00' , '" + email + "' , '123', 'admin', 'sem-foto.jpg')");
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

<link rel="shortcut icon" href="../img/favicon1.ico" type="image/x-icon">
<link rel="icon" href="../img/favicon1.ico" type="image/x-icon">
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
                                <%                                    String email = request.getParameter("email");
                                    String senha = request.getParameter("senha");
                                    String nomeUsuario = "";
                                    String cpfUsuario = "";
                                    String nivelUsuario = "";
                                    String fotoUsuario = "";
                                    String idUsuario = "";
                                    

                                    String user = "", pass = "";
                                    int i = 0;

                                    try {

                                        st = new Conexao().conectar().createStatement();
                                        rs = st.executeQuery("SELECT * FROM usuarios where email = '" + email + "' and senha = '" + senha + "'");
                                        while (rs.next()) {
                                            user = rs.getString(4);
                                            pass = rs.getString(5);
                                            nomeUsuario = rs.getString(2);
                                            cpfUsuario = rs.getString(3);
                                            nivelUsuario = rs.getString(6);
                                            fotoUsuario = rs.getString(7);
                                            idUsuario = rs.getString(1);
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
                                            session.setAttribute("nivelUsuario", nivelUsuario);
                                            session.setAttribute("fotoUsuario", fotoUsuario);
                                            session.setAttribute("idUsuario", idUsuario);
                                            if(nivelUsuario.equals("admin")){
                                               response.sendRedirect("painel-admin"); 
                                            }
                                            
                                             if(nivelUsuario.equals("corretor")){
                                               response.sendRedirect("painel-corretor"); 
                                            }
                                             
                                             if(nivelUsuario.equals("tesoureiro")){
                                               response.sendRedirect("painel-tesouraria"); 
                                            }
                                            
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
                <div class="logo">
                    
                    <span class="d-none d-md-block">IMOB</span>

                    <div class="clearfix"></div>
                </div>

            </div>
        </center>
    </div>

</div>

