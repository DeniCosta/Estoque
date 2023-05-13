<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ page import="model.JavaBeans" %>
<%@ page import="model.DAO" %>

<%
try {
    JavaBeans produto = new JavaBeans();
    DAO banco = new DAO();

    String codigo = request.getParameter("codigo");
    String nome = request.getParameter("nome");
    String categoria = request.getParameter("categoria");
    String valor = request.getParameter("valor");
    String quantidade = request.getParameter("quantidade");
    String idParam = request.getParameter("id");

    boolean formSubmetido = codigo != null && nome != null && valor != null && quantidade != null && idParam != null;

    if (formSubmetido) {
        if (codigo.isEmpty() || nome.isEmpty() || valor.isEmpty() || quantidade.isEmpty() || idParam.isEmpty()) {
            out.print("<script>alert('Campos obrigatórios!');</script>");
            response.sendRedirect("index.jsp");
        } else {
            int codigo1 = Integer.parseInt(codigo);
            float valor1 = Float.parseFloat(valor);
            int quantidade1 = Integer.parseInt(quantidade);
            int id = Integer.parseInt(idParam);

            produto.setCodigo(codigo1);
            produto.setNome(nome);
            produto.setCategoria(categoria);
            produto.setValor(valor1);
            produto.setQuantidade(quantidade1);
            produto.setId(id);
            banco.atualizarTabela(produto);
            out.print("<script>alert('Atualizado com sucesso');</script>");
            out.print("<script>window.location.href='index.jsp'</script>");
        }
    }
} catch (Exception ex) {
    System.out.println("Deu erro no alterar: " + ex.getMessage());
}
%>
