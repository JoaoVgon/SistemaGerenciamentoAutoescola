<%-- 
    Document   : alterarUsuario
    Created on : 05/12/2018, 16:21:49
    Author     : Usuario
--%>

<%@page import="br.edu.ifpr.irati.jsp.modelo.Atendente"%>
<%@page import="br.edu.ifpr.irati.jsp.controle.ControleAtendente"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Alterar Atendente</title>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/materialize/1.0.0-beta/css/materialize.min.css">
        <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
        <script src="https://code.jquery.com/jquery-3.3.1.min.js" integrity="sha256-FgpCb/KJQlLNfOu91ta32o/NMZxltwRo8QtmkMRdAu8="  crossorigin="anonymous"></script>
        <link href="https://cdnjs.cloudflare.com/ajax/libs/jquery.mask/1.14.10/jquery.mask.min.js">
    </head>

    <style>

        div#titulo {
            background-color: lightgray;
            padding: 3px;
        }

        div#titulo h5 {
            font-weight: bold;
        }

        div#titulo h6 {
            font-weight: bold;
        }

        .input-field .prefix.active {
            color: lightskyblue;
        }

    </style>

    <body>

        <header>
            <jsp:include page="cabecalho.jsp" flush="true" />
        </header>

        <main>
            <%

                int id = Integer.parseInt(request.getParameter("idusuario"));

                ControleAtendente ca = new ControleAtendente();
                Atendente a = ca.buscarAtendentePorId(id);
                
                String cidadeAtuacao = "";
                if(a.getCidadeAtuacao() != null){
                    cidadeAtuacao = a.getCidadeAtuacao();
                }
                String telefone;
                if (a.getTelefone() == null) {
                    telefone = "";
                } else {
                    telefone = a.getTelefone();
                }
                String telefoneCelular;
                if (a.getTelefoneCelular() == null) {
                    telefoneCelular = "";
                } else {
                    telefoneCelular = a.getTelefoneCelular();
                }
            %>

            <form action="scripts/alterarusuario.jsp" method="POST">
                <input type="hidden" name="idUsuario" value="<%=a.getIdUsuario()%>"/>
                <div class="col s14 m12">
                    <div class="card">
                        <div class="card-content">

                            <div id="titulo" class="amber">
                                <h5 align="center">Alterar Dados do Atendente</h5>
                            </div>

                            <div id="titulo">
                                <h6 align="center"> Dados Pessoais </h6>
                            </div>

                            <div class="row">
                                <div class="input-field col s12">
                                    <i class="material-icons prefix">person</i>
                                    <input value="<%=a.getNomeCompleto()%>" placeholder="" id="nome" name="nome" type="text" class="validate" maxlength="100" required>
                                    <label for="nome">Nome completo</label>
                                    <span class="helper-text" data-error="Campo obrigatório!" data-success="Ok!"></span>
                                </div>
                            </div>

                            <div id="titulo">
                                <h6 align="center"> Dados Profissionais </h6>
                            </div>

                            <div class="row">
                                <div class="input-field col s4">
                                    <i class="material-icons prefix">person</i>
                                    <input value="<%=a.getLogin()%>" placeholder="" id="usuario" name="usuario" type="text" class="validate" maxlength="100" required>
                                    <label for="usuario">Usuário</label>
                                    <span class="helper-text" data-error="Campo obrigatório!" data-success="Ok!"></span>
                                </div>
                                <div class="input-field col s4">
                                    <i class="material-icons prefix">lock</i>
                                    <input value="" placeholder="" id="senha" name="senha" type="text" class="validate" maxlength="100" required>
                                    <label for="senha">Senha</label>
                                    <span class="helper-text" data-error="Campo obrigatório!" data-success="Ok!"></span>
                                </div>
                                <div class="input-field col s4">
                                    <i class="material-icons prefix">location_city</i>
                                    <input value="<%=cidadeAtuacao%>" placeholder="" id="cidadeAtuacao" name="cidadeAtuacao" type="text" maxlength="100">
                                    <label for="cidadeAtuacao">Cidade de atuação</label>
                                </div>
                            </div>

                            <div id="titulo">
                                <h6 align="center">Contato</h6>
                            </div>

                            <div class="row">
                                <div class="input-field col s6">
                                    <i class="material-icons prefix">local_phone</i>
                                    <input value="<%=telefone%>" placeholder="" type="text" name="telefone" maxlength="13" onkeydown="javascript: fMasc(this, mTel);" onkeypress="if (!isNaN(String.fromCharCode(window.event.keyCode)))
                                            return true;
                                        else
                                            return false;">
                                    <label for="telefone">Telefone</label>                             
                                </div>
                                <div class="input-field col s6">
                                    <i class="material-icons prefix">local_phone</i>
                                    <input value="<%=telefoneCelular%>" placeholder="" type="text" name="telefonecelular" maxlength="14" onkeydown="javascript: fMasc(this, mTel);" onkeypress="if (!isNaN(String.fromCharCode(window.event.keyCode)))
                                            return true;
                                        else
                                            return false;">
                                    <label for="telefonecelular">Telefone celular</label>                             
                                </div>
                            </div>

                            <div class="center input-field col s12">
                                <button class="blue waves-effect waves-light btn col s6" type="submit">Salvar Alterações
                                </button>
                            </div>
                        </div>
                    </div>
                </div>

            </form>
        </main>
        <footer>
            <jsp:include page="rodape.jsp" flush="true" />
        </footer>
        
        <script src="https://cdnjs.cloudflare.com/ajax/libs/materialize/1.0.0/js/materialize.min.js"></script>

        <script>

            function fMasc(objeto, mascara) {
                obj = objeto;
                masc = mascara;
                setTimeout("fMascEx()", 1);
            }
            function fMascEx() {
                obj.value = masc(obj.value);
            }

            function mTel(tel) {
                tel = tel.replace(/\D/g, "");
                tel = tel.replace(/^(\d)/, "($1");
                tel = tel.replace(/(.{3})(\d)/, "$1)$2");
                if (tel.length === 9) {
                    tel = tel.replace(/(.{1})$/, "-$1");
                } else if (tel.length === 10) {
                    tel = tel.replace(/(.{2})$/, "-$1");
                } else if (tel.length === 11) {
                    tel = tel.replace(/(.{3})$/, "-$1");
                } else if (tel.length === 12) {
                    tel = tel.replace(/(.{4})$/, "-$1");
                } else if (tel.length > 12) {
                    tel = tel.replace(/(.{4})$/, "-$1");
                }
                return tel;
            }

        </script>
    </body>
</html>
