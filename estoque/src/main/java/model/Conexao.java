package model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class Conexao {
	
	private Connection conexao;
    private String driver = "com.mysql.cj.jdbc.Driver";
    // informações de conexão com o banco de dados
    private String url = "jdbc:mysql://localhost:3306/projeto1?useTimezone=true&serverTimezone=UTC";
    private String user = "root";
    private String senha = "";
	
	   public Connection conectar() {
	        try {
	            Class.forName(driver);
	            conexao = DriverManager.getConnection(url,user,senha);
	            return conexao;
	        } catch(Exception ex) {
	            System.out.println(ex.getMessage());
	            return null;
	        }
	    }
	   
	    public void fecharConexao() {
	        try {
	            if(conexao != null) {
	                conexao.close();
	            }
	        } catch(SQLException ex) {
	            System.out.println(ex.getMessage());
	        }
	    }
	
}
