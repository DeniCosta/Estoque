<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
         pageEncoding="ISO-8859-1"%>
<%@page import="model.JavaBeans" %>
<%@page import= "model.DAO" %>

<%@page import="java.util.ArrayList"%>

<!DOCTYPE html>
<html>
<head>
  <meta charset="ISO-8859-1">
  <link rel="stylesheet" href="style.css">
  <link href="https://fonts.googleapis.com/css2?family=Roboto:wght@400;700&display=swap" rel="stylesheet">
  <title>INDEX</title>
</head>
<body>
<div class="container">
<form class="firstForm" action="index.jsp" method="post">
  <label>CATEGORIA</label><br>
  <input type="text" name="categoria"/><br>
  <button type="submit"> PESQUISAR</button><br>
  <span>é a vida né</span>

</form>

<form action="inserir.jsp"><br>
  <button type="submit">NOVO CADASTRO</button>
</form>
<%
  String categoria = request.getParameter("categoria");
  try{
    out.print("<table border='0'>");
    out.print("<tr>");
    out.print("<th>ID</th>");
    out.print("<th>CODIGO</th>");
    out.print("<th>NOME</th>");
    out.print("<th>CATEGORIA</th>");
    out.print("<th>VALOR</th>");
    out.print("<th>QUANTIDADE</th>");
    out.print("<th>EDITAR</th>");
    out.print("<th>EXCLUIR</th>");
    out.print("</tr>");

    DAO banco = new DAO();
    if(categoria == "" || categoria == null){
      ArrayList<JavaBeans> lista = banco.listarTodaTabela();
      for(int i = 0; i < lista.size(); i++){
        out.print("<tr>");
        out.print("<td>"+lista.get(i).getId()+"</td>");
        out.print("<td>"+lista.get(i).getCodigo()+"</td>");
        out.print("<td>"+lista.get(i).getNome()+"</td>");
        out.print("<td>"+lista.get(i).getCategoria()+"</td>");
        out.print("<td>"+lista.get(i).getValor()+"</td>");
        out.print("<td>"+lista.get(i).getQuantidade()+"</td>");

        out.print("<td><a href='alterar.jsp?id="+lista.get(i).getId()+

                "&codigo="+lista.get(i).getCodigo()+
                "&nome="+lista.get(i).getNome()+
                "&categoria="+lista.get(i).getCategoria()+
                "&valor="+lista.get(i).getValor()+
                "&quantidade"+lista.get(i).getQuantidade()+" '>CLIQUE</a></td>");
        out.print("<td><a href='excluir.jsp?id="+lista.get(i).getId()+
                "&id="+lista.get(i).getId()+
                "'>CLIQUE</a></td>");
        out.print("</tr>");
      }

    }else{
      ArrayList<JavaBeans> lista = banco.listarPorCategoria(categoria);
      for(int i = 0; i < lista.size(); i++){
        out.print("<tr>");
        out.print("<td>"+lista.get(i).getId()+"</td>");
        out.print("<td>"+lista.get(i).getCodigo()+"</td>");
        out.print("<td>"+lista.get(i).getNome()+"</td>");
        out.print("<td>"+lista.get(i).getCategoria()+"</td>");
        out.print("<td>"+lista.get(i).getValor()+"</td>");
        out.print("<td>"+lista.get(i).getQuantidade()+"</td>");

        out.print("<td><a href='alterar.jsp?id="+lista.get(i).getId()+

                "&codigo="+lista.get(i).getCodigo()+
                "&nome="+lista.get(i).getNome()+
                "&categoria="+lista.get(i).getCategoria()+
                "&valor="+lista.get(i).getValor()+
                "&quantidade"+lista.get(i).getQuantidade()+" '>CLIQUE</a></td>");
        out.print("<td><a href='excluir.jsp?id="+lista.get(i).getId()+
                "&id="+lista.get(i).getId()+
                "'>CLIQUE</a></td>");
        out.print("</tr>");
      }
    }
    out.print("</table");
  } catch(Exception erro){
    System.out.println("Deu Erro no index"+erro.getMessage());
  }
%>
</div>
</body>
</html>