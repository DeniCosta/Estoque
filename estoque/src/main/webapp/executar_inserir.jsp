<%@ page import="java.sql.SQLException"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="model.JavaBeans"%>
<%@ page import="model.DAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%
    DAO bancoDados = new DAO();
    String codigo = request.getParameter("codigo");
    String nome = request.getParameter("nome");
    String categoria = request.getParameter("categoria");
    String valor = request.getParameter("valor");
    String quantidade = request.getParameter("quantidade");

    if (codigo != null && nome != null && categoria != null && valor != null && quantidade != null) {
        try {
            int codigo1 = Integer.parseInt(codigo);
            float valor1 = Float.parseFloat(valor);
            int quantidade1 = Integer.parseInt(quantidade);
            
            if (codigo1 > 0 && !nome.isEmpty() && !categoria.isEmpty() && valor1 > 0 && quantidade1 > 0) {
                JavaBeans produto = new JavaBeans();
                produto.setCodigo(codigo1);
                produto.setNome(nome);
                produto.setCategoria(categoria);
                produto.setValor(valor1);
                produto.setQuantidade(quantidade1);
                bancoDados.inserir(produto);
                out.print("<script>alert('Cadastro Efetuado com sucesso!');</script>");
                out.print("<script>window.location.href='index.jsp';</script>");
            } else {
                out.print("<script>alert('Valores inválidos!');</script>");
                response.sendRedirect("inserir.jsp");
            }
        } catch (NumberFormatException ex) {
            out.print("<script>alert('Valores inválidos!');</script>");
            response.sendRedirect("inserir.jsp");
        } 
    } else {
        out.print("<script>alert('Campos obrigatórios!');</script>");
        response.sendRedirect("inserir.jsp");
    }
%>

