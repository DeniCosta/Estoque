<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Cadastro De Produtos</title>
</head>
<body>
	<form action="executar_inserir.jsp" method="post">
	<label>CODIGO</label><br>
	<input type="number" name="codigo"/><br>
	<label>NOME</label><br>
	<input type="text" name="nome"/><br>
	<label>CATEGORIA</label><br>
	<input type="text" name="categoria"/><br>
	<label>VALOR</label><br>
	<input type="number" name="valor"/><br>
	<label>QUANTIDADE</label><br>
	<input type="number" name="quantidade"/><br>
	<button type="submit">CADASTRAR</button>
	</form>
	<form action="index.jsp"><br>
	<button type="submit">VOLTAR</button>
	</form>
	
</body>
</html>