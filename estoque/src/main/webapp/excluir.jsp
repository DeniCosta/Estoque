<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="model.JavaBeans" %>
<%@ page import="model.DAO" %>
<%@ page import="java.util.ArrayList" %>

<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Excluir</title>
</head>
<body>
	<form action="executar_excluir.jsp" method="post">
		<label>ID</label><br>
		<input type="number" name="id" value="<%=request.getParameter("id") %>"/>
		<button type="submit">EXCLUIR</button>
	</form>
	
	<table border='1'>
		<tr>
			<th>ID</th>
			<th>CODIGO</th>
			<th>NOME</th>
			<th>CATEGORIA</th>
			<th>VALOR</th>
			<th>QUANTIDADE</th>
		</tr>
		
		<%
		try {
			DAO banco = new DAO();
			ArrayList<JavaBeans> lista = banco.listarTodaTabela();
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
		</tr>
		<%
			}
			banco.fecharConexao();
		} catch (Exception erro) {
			out.println("Deu Erro no index" + erro.getMessage());
		}
		%>
	</table>

	<form action="index.jsp">
		<button type="submit">VOLTAR</button>
	</form>
</body>
</html>

