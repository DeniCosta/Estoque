<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
    
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<form action="executar_alterar.jsp" method="post">
	
	<label>ID</label><br>
	<input type="number" name="id" value="<%=request.getParameter("id") %>" readonly/><br>
	<label>CODIGO</label><br>
	<input type="number" name="codigo" value="<%=request.getParameter("codigo") %>"/><br>
	<label>NOME</label><br>
	<input type="text" name="nome" value="<%=request.getParameter("nome") %>"/><br>
	<label>CATEGORIA</label><br>
	<input type="text" name="categoria" value="<%=request.getParameter("categoria") %>"/><br>
	<label>VALOR</label><br>
	<input type="number" name="valor" value="<%=request.getParameter("valor") %>"/><br>
	<label>QUANTIDADE</label><br>
	<input type="number" name="quantidade" value="<%=request.getParameter("quantidade") %>"/><br>
	
		<button type="submit">ALTERAR</button>
		<form action="index.jsp"><br>
	</form>

	
	<button type="submit">VOLTAR</button>
</form>


</body>
</html>