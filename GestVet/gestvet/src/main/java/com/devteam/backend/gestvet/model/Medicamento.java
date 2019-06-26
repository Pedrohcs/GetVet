package com.devteam.backend.gestvet.model;

import javax.persistence.*;
import javax.validation.constraints.NotBlank;

@Entity
@Table(name = "medicamento", uniqueConstraints = {
        @UniqueConstraint(columnNames = "nome")
})
public class Medicamento {

    @Id
    @Column
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private long id;

    @Column
    @NotBlank
    private String nome;
    @Column
    private double preco;
    @Column
    private String dosagem;

    public Medicamento(@NotBlank String nome, double preco, String dosagem) {
        this.nome = nome;
        this.preco = preco;
        this.dosagem = dosagem;
    }

    public long getId() {
        return id;
    }

    public void setId(long id) {
        this.id = id;
    }

    public String getNome() {
        return nome;
    }

    public void setNome(String nome) {
        this.nome = nome;
    }

    public double getPreco() {
        return preco;
    }

    public void setPreco(double preco) {
        this.preco = preco;
    }

    public String getDosagem() {
        return dosagem;
    }

    public void setDosagem(String dosagem) {
        this.dosagem = dosagem;
    }
}
