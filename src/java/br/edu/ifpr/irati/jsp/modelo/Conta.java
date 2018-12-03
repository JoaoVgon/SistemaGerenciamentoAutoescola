package br.edu.ifpr.irati.jsp.modelo;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.Id;
import javax.persistence.ManyToMany;
import javax.persistence.OneToOne;

@Entity(name = "conta")
public class Conta implements Serializable {

    @Id
    @OneToOne
    private Aluno aluno;

    @Column(name = "valortotal", nullable = false)
    private double valorTotal;
    
    @Column(name = "valorinicial", nullable = true)
    private double valorInicial;

    @Column(name = "valorpago", nullable = true)
    private double valorPago;

    @Column(name = "parcelas", nullable = false)
    private int parcelas;

    @Column(name = "anotacoes", nullable = true, length = 65000)
    private String anotacoes;

    @ManyToMany
    private List<Registro> registros;

    @ManyToMany(fetch = FetchType.EAGER)
    private List<Servico> servicos;

    public Conta() {
        valorTotal = 0.0;
        valorInicial = 0.0;
        valorPago = 0.0;
        parcelas = 0;
        aluno = new Aluno();
        registros = new ArrayList<>();
        servicos = new ArrayList<>();
        anotacoes = "";
    }

    public Conta(double valorTotal, double valorInicial, double valorPago, int parcelas, Aluno aluno, List<Servico> servicos, String anotacoes) {
        this.valorTotal = valorTotal;
        this.valorInicial = valorInicial;
        this.valorPago = valorPago;
        this.parcelas = parcelas;
        this.aluno = aluno;
        registros = new ArrayList<>();
        this.servicos = servicos;
        this.anotacoes = anotacoes;
    }

    public Conta(double valorTotal, double valorInicial, double valorPago, int parcelas, Aluno aluno, List<Registro> registros, List<Servico> servicos, String anotacoes) {
        this.valorTotal = valorTotal;
        this.valorInicial = valorInicial;
        this.valorPago = valorPago;
        this.parcelas = parcelas;
        this.aluno = aluno;
        this.registros = registros;
        this.servicos = servicos;
        this.anotacoes = anotacoes;
    }

    public void adicionarRegistro(Registro registro) {
        this.registros.add(registro);
        registro.setConta(this);
    }

    public void removerRegistro(Registro registro) {
        this.registros.remove(registro);
        registro.setConta(new Conta());
    }

    public double getValorTotal() {
        return valorTotal;
    }

    public void setValorTotal(double valorTotal) {
        this.valorTotal = valorTotal;
    }

    public int getParcelas() {
        return parcelas;
    }

    public void setParcelas(int parcelas) {
        this.parcelas = parcelas;
    }

    public Aluno getAluno() {
        return aluno;
    }

    public void setAluno(Aluno aluno) {
        this.aluno = aluno;
    }

    public List<Registro> getRegistros() {
        return registros;
    }

    public void setRegistros(List<Registro> registros) {
        this.registros = registros;
    }

    public List<Servico> getServicos() {
        return servicos;
    }

    public void setServicos(List<Servico> servicos) {
        this.servicos = servicos;
    }

    public double getValorPago() {
        return valorPago;
    }

    public void setValorPago(double valorPago) {
        this.valorPago = valorPago;
    }

    public String getAnotacoes() {
        return anotacoes;
    }

    public void setAnotacoes(String anotacoes) {
        this.anotacoes = anotacoes;
    }

    public double getValorInicial() {
        return valorInicial;
    }

    public void setValorInicial(double valorinicial) {
        this.valorInicial = valorinicial;
    }

}
