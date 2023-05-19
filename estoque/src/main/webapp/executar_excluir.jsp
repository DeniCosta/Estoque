<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="model.DAO"%>

<%
try {
	DAO banco = new DAO();
	String idString = request.getParameter("id");

	if (idString != null && !idString.isEmpty()) {
		int id = Integer.parseInt(idString);
		banco.excluirDaTabela(id);
		out.print("<script>alert('Registro excluído com sucesso')</script>");
		out.print("<script>window.location.href='index.jsp';</script>");
	} else {
		out.print("<script>alert('ID inválido')</script>");
		out.print("<script>window.location.href='index.jsp';</script>");
	}
	banco.fecharConexao();
} catch (Exception ex) {
	out.print("<script>alert('Erro ao excluir registro: " + ex.getMessage() + "')</script>");
	out.print("<script>window.location.href='index.jsp';</script>");
}
%>