<%@ page import="model.JavaBeans" %> <!-- Importe a classe JavaBeans correspondente -->
<%@ page import="model.DAO" %>
<html>
<head>
    <title>Atualizar Produto</title>
</head>
<body>
    <h1>Atualizar Produto</h1>
    <form action="alterar.jsp" method="post">
      <label>ID</label><br>
	<input type="number" name="id" value="<%=request.getParameter("id") %>" readonly/><br>
	<label>CODIGO</label><br>
	<input type="number" name="codigo" /><br>
	<label>NOME</label><br>
	<input type="text" name="nome" /><br>
	<label>CATEGORIA</label><br>
	<input type="text" name="categoria" /><br>
	<label>VALOR</label><br>
	<input type="number" name="valor"/><br>
	<label>QUANTIDADE</label><br>
	<input type="text" name="quantidade" /><br>
	</br>
        <button type="submit">ALTERAR</button>
	</form>
	<form action="index.jsp"><br>
	<button type="submit">VOLTAR</button>
	
    </form>

    <%-- Verifique se os parâmetros foram enviados --%>
    <% if (request.getParameter("codigo") != null &&
          request.getParameter("nome") != null &&
          request.getParameter("categoria") != null &&
          request.getParameter("valor") != null &&
          request.getParameter("quantidade") != null) {

          // Crie um objeto Produto com os parâmetros recebidos
          JavaBeans produto = new JavaBeans();
          produto.setId(Integer.parseInt(request.getParameter("id")));
          produto.setCodigo(Integer.parseInt(request.getParameter("codigo")));
          produto.setNome(request.getParameter("nome"));
          produto.setCategoria(request.getParameter("categoria"));
          produto.setValor(Float.parseFloat(request.getParameter("valor")));
          produto.setQuantidade(Integer.parseInt(request.getParameter("quantidade")));

          // Chame o método de atualização no banco de dados
          new DAO().atualizarTabela(produto);
          
          // Redirecione para a página index.jsp após a inserção
          response.sendRedirect("index.jsp");
    %>
        <p>Tabela atualizada com sucesso!</p>
    <% } %>
</body>
</html>
