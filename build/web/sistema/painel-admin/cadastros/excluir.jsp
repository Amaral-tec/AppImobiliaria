<%@page import="java.sql.*"%>
<%@page import="com.mysql.jdbc.Driver"%>
<%@page import="dao.ConnectionFactory"%>  

<% String id = request.getParameter("id"); %>

<%
    Statement st = null;
    ResultSet rs = null;

    try {
        
        st = new ConnectionFactory().conectar().createStatement();
        

        //recuperar o cpf do usuario para exclusão
        String cpf = "";
        rs = st.executeQuery("SELECT * FROM tb_setores where cpf = '" + cpf + "' ");
        while (rs.next()) {
            cpf = rs.getString(3);
            
        }
        
        st.executeUpdate("DELETE from tb_usuarios where cpf = '" + cpf + "'");

        out.print("Excluído com Sucesso!!");

    } catch (Exception e) {
        out.print(e);
    }

%>