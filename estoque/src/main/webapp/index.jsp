<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ page import="model.JavaBeans" %>
<%@ page import="model.DAO" %>
<%@ page import="model.Conexao" %>
<%@ page import="java.util.ArrayList" %>

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
      <input type="text" name="categoria" /><br>
      <button type="submit">PESQUISAR</button><br>
    </form>

    <form action="inserir.jsp">
      <button type="submit">NOVO CADASTRO</button>
    </form>
    
    <form action="excluir.jsp">
      <button type="submit">EXCLUIR CADASTRO</button>
    </form>

    <table border='1'>
      <tr>
        <th>ID</th>
        <th>CODIGO</th>
        <th>NOME</th>
        <th>CATEGORIA</th>
        <th>VALOR</th>
        <th>QUANTIDADE</th>
        <th>EDITAR</th>
       
      </tr>
      
      <%
      try {
        Conexao conexao = new Conexao();
        DAO banco = new DAO();

        // Obter o valor do parâmetro "categoria"
        
        String categoria = request.getParameter("categoria");

        // Verificar se a categoria foi fornecida
        if (categoria != null && !categoria.isEmpty()) {
          // Filtrar os resultados da consulta por categoria
          ArrayList<JavaBeans> lista = banco.listarPorCategoria(categoria);
          for (int i = 0; i < lista.size(); i++) {
            JavaBeans bean = lista.get(i);
      %>
      
      <tr>
        <td><%= bean.getId() %></td>
        <td><%= bean.getCodigo() %></td>
        <td><%= bean.getNome() %></td>
        <td><%= bean.getCategoria() %></td>
        <td><%= bean.getValor() %></td>
        <td><%= bean.getQuantidade() %></td>
        <td><a href='alterar.jsp?id=<%= bean.getId() %>'>CLIQUE</a></td>
        
      </tr>
      
      <%
          }
        } else {
          // Retorna todos os registros se nenhuma categoria for especificada
          ArrayList<JavaBeans> lista = banco.ListarTodaTabela();
          for (int i = 0; i < lista.size(); i++) {
            JavaBeans bean = lista.get(i);
      %>
      
      <tr>
        <td><%= bean.getId() %></td>
        <td><%= bean.getCodigo() %></td>
        <td><%= bean.getNome() %></td>
        <td><%= bean.getCategoria() %></td>
        <td><%= bean.getValor() %></td>
        <td><%= bean.getQuantidade() %></td>
        <td><a href='alterar.jsp?id=<%= bean.getId() %>'>CLIQUE</a></td>
       
      </tr>
      
      <%
          }
        }
        
        conexao.fecharConexao();
      } catch (Exception erro) {
        out.println("Deu Erro no index: " + erro.getMessage());
      }
      %>
      
    </table>
  </div>
</body>
</html>

