package controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.DAO;

/**
 * Esta é uma classe Java que implementa um Servlet, que é uma classe Java que processa requisições HTTP.
 */
@WebServlet("/Controller")
public class Controller extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	// Cria uma instância da classe BancoDeDados
	DAO dao = new DAO();
	
    public Controller() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * Este método é chamado quando uma requisição HTTP GET é recebida pelo Servlet.
	 * Ele escreve "Served at:" seguido do caminho do contexto da solicitação para a saída da resposta.
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * Este método é chamado quando uma requisição HTTP POST é recebida pelo Servlet.
	 * Ele chama o método doGet() para processar a solicitação.
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		doGet(request, response);
	}

}
