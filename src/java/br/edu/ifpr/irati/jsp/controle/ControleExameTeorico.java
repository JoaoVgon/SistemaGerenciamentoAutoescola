
package br.edu.ifpr.irati.jsp.controle;

import br.edu.ifpr.irati.jsp.dao.Dao;
import br.edu.ifpr.irati.jsp.dao.GenericDAO;
import br.edu.ifpr.irati.jsp.modelo.ExameTeorico;
import java.util.ArrayList;
import java.util.List;

public class ControleExameTeorico {
    
    
     public void inserirExameTeorico(ExameTeorico em){
        
        Dao<ExameTeorico> exameteoricoDAO = new GenericDAO<>(ExameTeorico.class);
        exameteoricoDAO.salvar(em);
        
    }
    
    public void alterarExameTeorico(ExameTeorico em){
        
        Dao<ExameTeorico> exameteoricoDAO = new GenericDAO<>(ExameTeorico.class);
        exameteoricoDAO.alterar(em);
        
    }
    
    public void excluirExameTeorico(ExameTeorico em){
        
        Dao<ExameTeorico> exameteoricoDAO = new GenericDAO<>(ExameTeorico.class);
        exameteoricoDAO.excluir(em);
        
    }
    
    
    public List<ExameTeorico> buscarTodosExameTeoricos(){
        
        Dao<ExameTeorico> exameteoricoDAO = new GenericDAO<>(ExameTeorico.class);
        List<ExameTeorico> exameteoricos = new ArrayList<>();
        exameteoricos = exameteoricoDAO.buscarTodos(ExameTeorico.class);
        return exameteoricos;
        
    }
    
    public ExameTeorico buscarExameTeoricosPorId(int idExameTeorico){
        
        Dao<ExameTeorico> exameteoricoDAO = new GenericDAO<>(ExameTeorico.class);
        ExameTeorico em = exameteoricoDAO.buscarPorId(idExameTeorico);
        return em;
        
    }
    
}


