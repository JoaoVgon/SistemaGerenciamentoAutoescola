<%@page import="br.edu.ifpr.irati.jsp.controle.ControleVeiculo"%>
<%@page import="br.edu.ifpr.irati.jsp.modelo.Veiculo"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%

    request.setCharacterEncoding("UTF-8");

    String placa = request.getParameter("placa");
    String anoFabricacao = request.getParameter("anoFabricacao");
    String marca = request.getParameter("marca");
    String modelo = request.getParameter("modelo");

    Veiculo v = new Veiculo(placa, marca, modelo, anoFabricacao);

    ControleVeiculo cv = new ControleVeiculo();
    cv.inserirVeiculo(v);
    
    response.sendRedirect("../veiculo.jsp");

%>
