<%@page import="java.util.ArrayList"%>
<%@page import="br.edu.ifpr.irati.jsp.modelo.Aluno"%>
<%@page import="java.util.List"%>
<%@page import="br.edu.ifpr.irati.jsp.controle.ControleAluno"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Aluno</title>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/materialize/1.0.0-beta/css/materialize.min.css">
        <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
        <script src="https://code.jquery.com/jquery-3.3.1.min.js" integrity="sha256-FgpCb/KJQlLNfOu91ta32o/NMZxltwRo8QtmkMRdAu8="  crossorigin="anonymous"></script>
    </head>

    <style>

        a {
            color: white;
        }

    </style>

    <body>
        <header>
            <jsp:include page="cabecalho.jsp" flush="true" />
        </header>

        <main>
            <table class="centered striped">
                <tr>
                    <th>Nº do Processo</th>
                    <th>Nome Completo</th>
                    <th>CPF</th>
                    <th>RG</th>
                    <th>Data de Nascimento</th>
                    <th></th>
                    <th></th>
                </tr>
                <%
                    SimpleDateFormat sdf = new SimpleDateFormat("dd/MM/yyyy");
                    
                    ControleAluno controleAluno = new ControleAluno();
                    List<Aluno> alunos = controleAluno.buscarTodosAlunos();

                    for (Aluno aluno : alunos) {
                %>
                <tr>
                    <td><%=aluno.getProcesso()%></td>
                    <td><%=aluno.getNomeCompleto()%></td>
                    <td><%=aluno.getCpf()%></td>
                    <td><%=aluno.getRg()%></td>
                    <td><%=sdf.format(aluno.getDataNascimento())%></td>
                    <td><a href="mostrarAluno.jsp?idPessoa=<%=aluno.getIdPessoa()%>" class="waves-effect waves-light btn-floating" value="VerMais"><i class="material-icons">control_point</i></a></td>
                    <td><a href="alterarAluno.jsp?idPessoa=<%=aluno.getIdPessoa()%>" class="waves-effect waves-light btn" value="Alterar"> Alterar </a></td>
                </tr>
                <%
                    }
                %>
            </table>
            
            <br>
            <div class="row">
                <div class="center input-field col s6">
                    <a href="cadastrarAluno.jsp" class="waves-effect waves-light btn" type="button">CADASTRAR</a>
                </div>
                <div class="center input-field col s6">
                    <a href="telaInicial.jsp" class="waves-effect waves-light btn" type="button">VOLTAR</a>
                </div>
            </div>

        </main>

        <footer>
            <jsp:include page="rodape.jsp" flush="true" />
        </footer>                
        <script src="https://cdnjs.cloudflare.com/ajax/libs/materialize/1.0.0-beta/js/materialize.min.js"></script>

    </body>
</html>
