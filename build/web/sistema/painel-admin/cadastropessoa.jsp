<% String pag = "cadastropessoa";%>

<%@page import="dao.Upload" %>
<%@page import="java.sql.*"%>
<%@page import="com.mysql.jdbc.Driver"%>
<%@page import="dao.ConnectionFactory"%>

<%
    Statement st = null;
    ResultSet rs = null;
%>

<div class="row mt-4 mb-4">
    <a type="button" class="btn-primary btn-sm ml-3 d-none d-md-block" href="index.jsp?pag=<%=pag%>&funcao=novo">Novo Cadastro</a>
    <a type="button" class="btn-primary btn-sm ml-3 d-block d-sm-none" href="index.jsp?pag=<%=pag%>&funcao=novo">+</a>

</div>

<!-- DataTales Example -->
<div class="card shadow mb-4">

    <div class="card-body">
        <div class="table-responsive">
            <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
                <thead>
                    <tr>
                        <th>Nome</th>
                        <th>CPF</th>
                        <th>Email</th>
                        <th>Telefone</th>
                    </tr>
                </thead>

                <tbody>

                    <%
                        try {
                            String nome = "";
                            String cpf = "";
                            String email = "";
                            String telefone = "";
                            String id = "";

                            st = new ConnectionFactory().conectar().createStatement();
                            rs = st.executeQuery("SELECT * FROM tb_usuarios order by nome asc ");
                            while (rs.next()) {
                                nome = rs.getString(2);
                                cpf = rs.getString(3);
                                email = rs.getString(4);
                                telefone = rs.getString(8);
                                id = rs.getString(1);
                    %>

                    <tr>
                        <td><%=nome%></td>
                        <td><%=cpf%></td>
                        <td><%=email%></td>
                        <td><%=telefone%></td>
                        <td>
                            <a href="index.jsp?pag=<%=pag%>&funcao=editar&id=<%=id%>" class='text-primary mr-1' title='Editar Dados'><i class='far fa-edit'></i></a>
                            <a href="index.jsp?pag=<%=pag%>&funcao=excluir&id=<%=id%>" class='text-danger mr-1' title='Excluir Registro'><i class='far fa-trash-alt'></i></a>
                        </td>
                    </tr>

                    <%  }
                        } catch (Exception e) {
                            out.print(e);
                        }
                    %>

                </tbody>
            </table>
        </div>
    </div>
</div>

<!-- Modal -->
<div class="modal fade" id="modalDados" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog modal-lg" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <%
                    String nome = "";
                    String cpf = "";
                    String email = "";
                    String mobilePhone = "";
                    String imagem = "sem-foto.jpg";
                    String id = "";
                    String titulo = "";

                    if (request.getParameter(
                            "id") != null) {
                        titulo = "Editar Registro";
                        id = request.getParameter("id");
                        try {
                            st = new ConnectionFactory().conectar().createStatement();
                            rs = st.executeQuery("SELECT * FROM tb_usuarios where id = '" + id + "' ");
                            while (rs.next()) {
                                nome = rs.getString(2);
                                cpf = rs.getString(3);
                                email = rs.getString(4);
                                mobilePhone = rs.getString(8);
                                imagem = rs.getString(7);
                            }
                        } catch (Exception e) {
                            out.print(e);
                        }
                    } else {
                        titulo = "Inserir Registro";
                    }
                %>
                <h5 class="modal-title" id="exampleModalLabel"><%=titulo%></h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <form id="form" method="POST" enctype="multipart/form-data">
                <div class="modal-body">
                    <div class="row ml-1">
                        <div class="col-md-8">
                            <div class="row">
                                <div class="col-md-6 col-sm-12">
                                    <div class="form-group">
                                        <label >Nome</label>
                                        <input value="<%=nome%>" type="text" class="form-control" id="nome" name="nome" placeholder="Nome">
                                    </div>
                                </div>
                                <div class="col-md-6 col-sm-12">
                                    <div class="form-group">
                                        <label >CPF</label>
                                        <input value="<%=cpf%>" type="text" class="form-control" id="cpf" name="cpf" placeholder="CPF">
                                    </div>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-md-6 col-sm-12">
                                    <div class="form-group">
                                        <label >Email</label>
                                        <input value="<%=email%>" type="email" class="form-control" id="email" name="email" placeholder="Email">
                                    </div>
                                </div>
                                <div class="col-md-6 col-sm-12">
                                    <div class="form-group">
                                        <label >Telefone</label>
                                        <input value="<%=mobilePhone%>" type="text" class="form-control" id="mobilePhone" name="mobilePhone" placeholder="Telefone">
                                    </div>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-md-6 col-sm-12 form-group">
                                    <label>Imagem</label>
                                    <input value="<%=imagem%>" type="file" class="form-control-file" id="imagem" name="imagem[]" onchange="carregarImg();">
                                </div>
                            </div>
                        </div>
                        <div class="col-md-4">
                            <div class="col-md-12">
                                <img src="../img/profiles/<%=imagem%>" alt="Carregue sua Imagem" id="target" width="200" height="200">
                            </div>
                        </div>
                        <small>
                            <div id="mensagem">
                            </div>
                        </small> 
                    </div>
                </div>
                <div class="modal-footer">
                    <input value="<%=id%>" type="hidden" name="txtid" id="txtid">
                    <input value="<%=cpf%>" type="hidden" name="antigo" id="antigo">
                    <button type="button" id="btn-fechar" class="btn btn-secondary" data-dismiss="modal">Cancelar</button>
                    <button type="submit" name="btn-salvar" id="btn-salvar" class="btn btn-primary">Salvar</button>
                </div>
            </form>
        </div>
    </div>
</div>

<div class="modal" id="modal-deletar" tabindex="-1" role="dialog">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title">Excluir Registro</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                <p>Deseja realmente Excluir este Registro?</p>
                <div align="center" id="mensagem_excluir" class="">
                </div>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-dismiss="modal" id="btn-cancelar-excluir">Cancelar</button>
                <form method="post">
                    <%id = request.getParameter("id");%>
                    <input type="hidden" id="id"  name="id" value="<%=id%>" required>
                    <button type="button" id="btn-deletar" name="btn-deletar" class="btn btn-danger">Excluir</button>
                </form>
            </div>
        </div>
    </div>
</div>

<%    if (request.getParameter("funcao") != null && request.getParameter("funcao").equals("novo")) {
        out.print("<script>$('#modalDados').modal('show');</script>");
    }
%>

<%    if (request.getParameter("funcao") != null && request.getParameter("funcao").equals("editar")) {
        out.print("<script>$('#modalDados').modal('show');</script>");
    }
%>


<%    if (request.getParameter("funcao") != null && request.getParameter("funcao").equals("excluir")) {
        out.print("<script>$('#modal-deletar').modal('show');</script>");
    }
%>                    

<!--SCRIPT PARA SUBIR IMAGEM PARA O SERVIDOR -->
<script type="text/javascript">

    function carregarImg() {

        var target = document.getElementById('target');
        var file = document.querySelector("input[type=file]").files[0];
        var reader = new FileReader();

        reader.onloadend = function () {
            target.src = reader.result;
        };
        if (file) {
            reader.readAsDataURL(file);
        } else {
            target.src = "";
        }
    }
</script>

<!--AJAX PARA INSERÇÃO E EDIÇÃO DOS DADOS COM IMAGEM -->
<script type="text/javascript">
    $("#form").submit(function () {
        var pag = "<%=pag%>";
        event.preventDefault();
        var formData = new FormData(this);
        $.ajax({
            url: pag + "/inserir.jsp",
            type: 'POST',
            data: formData,
            success: function (mensagem) {
                $('#mensagem').removeClass()
                if (mensagem.trim() == "Salvo com Sucesso!") {
                    $('#mensagem').addClass('text-success');
                    $('#btn-fechar').click();
                    window.location = "index.jsp?pag=" + pag;
                } else {
                    $('#mensagem').addClass('text-danger')
                }
                $('#mensagem').text(mensagem)
            },
            cache: false,
            contentType: false,
            processData: false,
            xhr: function () {  // Custom XMLHttpRequest
                var myXhr = $.ajaxSettings.xhr();
                if (myXhr.upload) { // Avalia se tem suporte a propriedade upload
                    myXhr.upload.addEventListener('progress', function () {
                        /* faz alguma coisa durante o progresso do upload */
                    }, false);
                }
                return myXhr;
            }
        });
    });
</script>

<!--AJAX PARA EXCLUSÃO DOS DADOS -->
<script type="text/javascript">
    $(document).ready(function () {
        var pag = "<%=pag%>";
        $('#btn-deletar').click(function (event) {
            event.preventDefault();
            $.ajax({
                url: pag + "/excluir.jsp",
                method: "post",
                data: $('form').serialize(),
                dataType: "text",
                success: function (mensagem) {
                    if (mensagem.trim() === 'Excluído com Sucesso!!') {
                        $('#btn-cancelar-excluir').click();
                        window.location = "index.jsp?pag=" + pag;
                    }
                    $('#mensagem_excluir').text(mensagem)
                },
            })
        })
    })
</script>

<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery.mask/1.14.11/jquery.mask.min.js"></script>

<script src="../../js/mascara.js"></script>