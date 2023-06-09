package model;

import java.sql.Connection;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;


import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class DAO {
	/** Módulo de conexão **/

   
    private Connection conexao;
    private PreparedStatement preparado;
    private ResultSet result;
    private ArrayList<JavaBeans> lista = new ArrayList<>();
    private Statement stat;
       
 
    
  //Metodo para fazer a inserção no banco de dados
    public void inserir(JavaBeans produto) {
        
        String dadosDoSql = "INSERT INTO produto (codigo,nome,"
                +"categoria,valor,quantidade) VALUES (?,?,?,?,?)";
        try {
        	conexao = new Conexao().conectar();
            preparado = conexao.prepareStatement(dadosDoSql);
            preparado.setLong(1, produto.getCodigo());
            preparado.setString(2, produto.getNome());
            preparado.setString(3, produto.getCategoria());
            preparado.setDouble(4, produto.getValor());
            preparado.setLong(5, produto.getQuantidade());
            preparado.executeUpdate();// Executa a inserção no banco de dados
            System.out.println("inserido os dados");
        }catch(SQLException ex) {
            System.out.println("Deu erro ao inserir os dados:"+ ex.getMessage());
        }
    }
    
    
  //metodo pra pesquisar tudo
  		public ArrayList<JavaBeans> ListarTodaTabela(){
  			String selectTabela = "SELECT * FROM produto";
  			try {
  				conexao = new Conexao().conectar();
  				stat = conexao.createStatement();
  				result = stat.executeQuery(selectTabela);
  				while(result.next()) {
  					JavaBeans produtos = new JavaBeans();
  					produtos.setId(result.getInt("id"));
  					produtos.setCodigo(result.getInt("codigo"));
  					produtos.setNome(result.getString("nome"));
  					produtos.setCategoria(result.getString("categoria"));
  					produtos.setValor(result.getDouble("valor"));
  					produtos.setQuantidade(result.getInt("quantidade"));
  					lista.add(produtos);
  				}
  				
  			}catch(SQLException ex) {
  				System.out.println("Deu erro na lista: "+ex.getMessage());
  			}
  			return lista;
  		}
  		
    public void atualizarTabela(JavaBeans produto) {
        String atualizar = "UPDATE produto SET codigo = ?, nome = ?, categoria = ?, valor = ?, quantidade = ? WHERE id = ?";
        try {
        	conexao = new Conexao().conectar();
            preparado = conexao.prepareStatement(atualizar);
            preparado.setInt(1, produto.getCodigo());
            preparado.setString(2, produto.getNome());
            preparado.setString(3, produto.getCategoria());
            preparado.setDouble(4, produto.getValor());
            preparado.setDouble(5, produto.getQuantidade());
            preparado.setInt(6, produto.getId());
            preparado.executeUpdate();
            System.out.println("Tabela atualizada com sucesso!");
        } catch(SQLException ex) {
            System.out.println("Deu erro ao atualizar a tabela: "+ ex.getMessage());
        } finally {
            try {
                if(preparado != null) {
                    preparado.close();
                }
            } catch(SQLException ex) {
                System.out.println("Erro ao fechar o preparado: "+ex.getMessage());
            }
        }
    }
  		
  //metodo para pesquisar por categoria
    public ArrayList<JavaBeans> listarPorCategoria(String valor) {
        String sql = "SELECT * FROM produto WHERE categoria LIKE '%"+valor+"%'";
        try {
        	conexao = new Conexao().conectar();
            stat = conexao.createStatement();
            result = stat.executeQuery(sql);
            while(result.next()) {
            	JavaBeans produto = new JavaBeans();
            	produto.setId(result.getInt("id"));
            	produto.setCodigo(result.getInt("codigo"));
            	produto.setNome(result.getString("nome"));
            	produto.setCategoria(result.getString("categoria"));
            	produto.setValor(result.getDouble("valor"));
            	produto.setQuantidade(result.getInt("quantidade"));
            	lista.add(produto);

            }
        } catch(SQLException ex) {
            System.out.println("Deu erro na lista por categoria: "+ex.getMessage());
        }
        return lista;
    }
  	    
    // Método para excluir da tabela
    public void excluirDaTabela(int id) {
        String excluirValorDigitado = "DELETE FROM produto WHERE id = ?";
        try {
        	conexao = new Conexao().conectar();
        	
            preparado = conexao.prepareStatement(excluirValorDigitado);
            preparado.setInt(1, id);
            preparado.executeUpdate();
            System.out.println("Dados excluídos com sucesso");
        } catch(SQLException ex) {
            System.out.println("Deu erro ao tentar excluir dados da tabela: " + ex.getMessage());
        }
    }

    

}
