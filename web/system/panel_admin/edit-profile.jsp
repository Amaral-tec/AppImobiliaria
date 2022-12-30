<%@page import="dao.ConnectionFactory"%>
<%@page import="dao.Upload"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>


<%
    Statement st = null;
    ResultSet rs = null;

    String name = "";
    String email = "";
    String mobilePhone = "";
    String password = "";
    String image = null;
    
    String id = "";
    String old = "";
 
    Upload up = new Upload();

    up.setFolderUpload("system/img/profiles");

    if (up.formProcess(getServletContext(), request)) {

        try {
            
            name = up.getForm().get("name").toString();
            email = up.getForm().get("email").toString();
            mobilePhone = up.getForm().get("mobilePhone").toString();
            password = up.getForm().get("password").toString();
            
            id = up.getForm().get("txtid").toString();
            old = up.getForm().get("old").toString();

            
            image = up.getFiles().get(0).toString();
            
            
            
        } catch (Exception e) {
            image = "user.png";
            
        }

        //INSERT THE DATA INTO THE DATABASE
        try {
            
            //check if the field is empty
            if(name.equals("")){
                out.print("Fill in the Name Field!!");
                return;
            }
            
            if(email.equals("")){
                out.print("Fill in the Email Field!!");
                return;
            }
            
            if(mobilePhone.equals("")){
                out.print("Fill in the Mobile Phone Field!!");
                return;
            }
            
            if(password.equals("")){
                out.print("Fill in the Passoword Field!!");
                return;
            }
            
            st = new ConnectionFactory().initConnection().createStatement();
            
            //CHECK IF THERE IS ALREADY A RECORD WITH THIS DATA IN THE BANK
            if(!email.equals(old)){
                rs = st.executeQuery("SELECT * FROM tb_users where email = '" + email + "'");
            while (rs.next()) {
                rs.getRow();
                if (rs.getRow() > 0) {
                    out.print("Email already Registered!");
                    return;
                }
            }
            }
                if(image.equals("user.png")){
                    st.executeUpdate("UPDATE tb_users SET name = '" + name + "', email = '" + email + "', mobilePhone = '" + mobilePhone + "', password = '" + password + "' WHERE id = '" + id + "'");
                }else{
                    st.executeUpdate("UPDATE tb_users SET name = '" + name + "', email = '" + email + "', mobilePhone = '" + mobilePhone + "', password = '" + password + "', image = '" + image + "' WHERE id = '" + id + "'");
                }
            out.print("Successfully Saved!!!");
        } catch (Exception e) {
            out.print(e);
        }

    }

%>
