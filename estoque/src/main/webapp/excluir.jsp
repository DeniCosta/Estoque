<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="model.JavaBeans" %>
<%@ page import="model.DAO" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="model.Conexao" %>

<%
try {
    Conexao conexao = new Conexao();
    DAO banco = new DAO();
    String idString = request.getParameter("id");

    if (idString != null && !idString.isEmpty()) {
        int id = Integer.parseInt(idString);
        banco.excluirDaTabela(id);
        out.print("<script>alert('Registro excluído com sucesso')</script>");
        out.print("<script>window.location.href='index.jsp';</script>");
    }

    ArrayList<JavaBeans> lista = banco.ListarTodaTabela();
    conexao.fecharConexao();
%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <link rel="stylesheet" href="excluir.css">
    <link href="https://fonts.googleapis.com/css2?family=Roboto:wght@400;700&display=swap" rel="stylesheet">
    <title>Excluir</title>
    <script>
        function confirme(id) {
            let confirme = confirm("Confirma a exclusão");
            if (confirme === true) {
                window.location.href = "delete?id=" + id;
            }
        }
    </script>  
</head>
<body>

	<div class="container">
		<div class="titulo">
			<h1>Excluir</h1>
		</div>
		<form>
			<label>Selecione o ID desejado</label><br> <input type="number"
				name="id" value="<%=request.getParameter("id") %>" />
			<button type="submit"
				onclick="confirme(<%=request.getParameter("id") %>)">EXCLUIR</button>
			<table border='1'>
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

					<% for (int i = 0; i < lista.size(); i++) {
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
					<% } %>
				</table>

				<form action="index.jsp">
					<button type="submit">VOLTAR</button>
				</form>
				</div>
				<a href="intro.jsp"><button class="inicio">
						Voltar<br>ao inicio
					</button></a>
</body>
</html>

<%
} catch (Exception ex) {
    out.print("<script>alert('Erro ao excluir registro: " + ex.getMessage() + "')</script>");
    out.print("<script>window.location.href='index.jsp';</script>");
}
%>
