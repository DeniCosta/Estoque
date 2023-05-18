<%@ page import="model.JavaBeans" %> 
<%@ page import="model.DAO" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Inserir Produto</title>
    <link rel="stylesheet" href="inserir.css">
    <link href="https://fonts.googleapis.com/css2?family=Roboto:wght@400;700&display=swap" rel="stylesheet">
</head>

<body>

<script src="validador.js"></script>


<div class="container">

    		<div class="titulo"><h1>Inserir Produto</h1></div>
    		<div class="formulario">
    <form action="inserir.jsp" method="post" name="form" onsubmit="return cadastrar()">
    <label>CODIGO</label><br>
	<input type="number" name="codigo" id="codigo"/><br>
	<label>NOME</label><br>
	<input type="text" name="nome" id="nome"/><br>
	<label>CATEGORIA</label><br>
	<input type="text" name="categoria"/><br>
	<label>VALOR</label><br>
	<input type="number" name="valor" id="valor"/><br>
	<label>QUANTIDADE</label><br>
	<input type="number" name="quantidade" id="quantidade"/><br>
	
	<button type="submit">CADASTRAR</button>
	
	</form>
	<form action="index.jsp">
	<button type="submit">VOLTAR</button>
	</form>
	</div>
</div>
    <%-- Verifique se os parâmetros foram enviados --%>
    <% if (request.getParameter("codigo") != null &&
          request.getParameter("nome") != null &&
          request.getParameter("categoria") != null &&
          request.getParameter("valor") != null &&
          request.getParameter("quantidade") != null) {

          // Crie um objeto Produto com os parâmetros recebidos
          JavaBeans produto = new JavaBeans();
          produto.setCodigo(request.getParameter("codigo"));
          produto.setNome(request.getParameter("nome"));
          produto.setCategoria(request.getParameter("categoria"));
          produto.setValor(request.getParameter("valor"));
          produto.setQuantidade(request.getParameter("quantidade"));

          
          // Chame o método de inserção no banco de dados
          new DAO().inserir(produto);
          

          // Redirecione para a página index.jsp após a inserção
          out.print("<script>alert('Produto cadastrado com sucesso')</script>");
          out.print("<script>window.location.href='index.jsp';</script>");
    %>
        <p>Dados inseridos com sucesso!</p>
    <% } %>
     <a href="intro.jsp"><button class="inicio">Voltar<br>ao inicio</button></a>
</body>
</html>
