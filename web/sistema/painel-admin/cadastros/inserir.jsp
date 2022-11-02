<%@page import="dao.*" %>
<%@page import="java.sql.*"%>
<%@page import="com.mysql.jdbc.Driver"%>


<%
    Statement st = null;
    ResultSet rs = null;

    String nome = "";
    String cpf = "";
    String email = "";
    String telefone = "";
    String imagem = null;

    String id = "";
    String antigo = "";

    Upload up = new Upload();

    //definir qual a pasta a ser salva
    up.setFolderUpload("sistema/img/profiles");

    if (up.formProcess(getServletContext(), request)) {

        try {

            nome = up.getForm().get("nome").toString();
            cpf = up.getForm().get("cpf").toString();
            email = up.getForm().get("email").toString();
            telefone = up.getForm().get("telefone").toString();
            imagem = up.getFiles().get(0).toString();
            id = up.getForm().get("txtid").toString();
            antigo = up.getForm().get("antigo").toString();
        } catch (Exception e) {
            imagem = "sem-foto.jpg";
        }

        //INSERIR OS DADOS NO BANCO DE DADOS
        try {
            //verificar se o campo é vazio
            if (nome.equals("")) {
                out.print("Preencha o Campo Nome teste!");
                return;
            }
            if (cpf.equals("")) {
                out.print("Preencha o Campo CPF!!");
                return;
            }

            st = new ConnectionFactory().conectar().createStatement();

            //VERIFICAR SE JA EXISTE UM REGISTRO COM ESTE DADO NO BANCO
            if (!cpf.equals(antigo)) {
                rs = st.executeQuery("SELECT * FROM tb_usuarios where cpf = '" + cpf + "'");
                while (rs.next()) {
                    rs.getRow();
                    if (rs.getRow() > 0) {
                        out.print("CPF Já Cadastrado!");
                        return;
                    }
                }
            }

            if (id.equals("")) {
                st.executeUpdate("INSERT into tb_usuarios (nome, cpf, telefone, email, endereco, foto) values ('" + nome + "', '" + cpf + "' , '" + telefone + "' , '" + email + "', '" + imagem + "')");
            } else {
                if (imagem.equals("sem-foto.jpg")) {
                    st.executeUpdate("UPDATE tb_usuarios SET nome = '" + nome + "', cpf = '" + cpf + "', telefone = '" + telefone + "', email = '" + email + "' WHERE id = '" + id + "'");
                } else {
                    st.executeUpdate("UPDATE tb_usuarios SET nome = '" + nome + "', cpf = '" + cpf + "', telefone = '" + telefone + "', email = '" + email + "' foto = '" + imagem + "' WHERE id = '" + id + "'");
                }

            }

            out.print("Salvo com Sucesso!!");
        } catch (Exception e) {
            out.print(e);
        }

    }

%>