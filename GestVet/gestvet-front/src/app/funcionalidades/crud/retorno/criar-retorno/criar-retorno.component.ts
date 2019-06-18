import { Component, OnInit } from '@angular/core';
import { Consulta } from '../../../../models/consulta.model';
import { ConsultaService } from '../../../../services/consulta.service';
import { Procedimento } from '../../../../models/procedimento.model';
import { UserService } from '../../../../services/user.service';
import { User } from '../../../../models/user.model';
import { AnimaisService } from '../../../../services/animais.service';
import { Animal } from '../../../../models/animal.model';

@Component({
  selector: 'app-criar-retorno',
  templateUrl: './criar-retorno.component.html',
  styleUrls: ['./criar-retorno.component.scss'],
  providers: [UserService, AnimaisService, ConsultaService]
})
export class CriarRetornoComponent implements OnInit {
  
  consulta: Consulta = new Consulta();
  selectedValue = Procedimento.BANHO;
  Procedimento = Procedimento;
  veterinarios : User[];
  animais : Animal[];
  consultas :  Consulta[];

  constructor(private consultaService: ConsultaService, private userService: UserService, private animaisService: AnimaisService) {}

  ngOnInit() {
    this.consulta.retorno = true; 
    this.consultaService.getConsultas()
      .subscribe(data => {
        this.consultas = data;
    });
    this.animaisService.getAnimais()
      .subscribe(data => {
        this.animais = data;
    });
    this.userService.getUsers()
      .subscribe(data => {
        this.veterinarios = data;
    });
  }

  createRetorno(): void {
    if(this.consulta.veterinario == null ||
      this.consulta.animal == null ||
      this.consulta.dataMarcada == null ||
      this.consulta.registro == (null || '') ||
      this.consulta.realizado == null ||
      this.consulta.retorno == null ||
      this.consulta.consultaOrigem == null ||
      this.consulta.procedimento == null ) {
      alert('Todos os campos devem ser preenchidos');
      return;
    }

    this.consultaService.createConsulta(this.consulta)
      .subscribe(data => {
        alert("Retorno cadastrado com sucesso.");
        (document.getElementById("formRetorno") as HTMLFormElement).reset();
      });
  }

}
