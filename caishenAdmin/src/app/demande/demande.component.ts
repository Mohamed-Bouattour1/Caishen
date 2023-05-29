import { Component } from '@angular/core';
import { ClientService } from '../services/client.service';
import { DemandeService } from '../services/demande.service';
import { ActivatedRoute, Router } from '@angular/router';

@Component({
  selector: 'app-demande',
  templateUrl: './demande.component.html',
  styleUrls: ['./demande.component.css']
})
export class DemandeComponent {

  id : any 
  demande : any = {}

  constructor(private readonly clientService: ClientService, private readonly demandeService: DemandeService, private activatedRoute: ActivatedRoute, private readonly router: Router) {}

    ngOnInit() {
      this.id = this.activatedRoute.snapshot.paramMap.get("dem") ;
      this.getOneDemande();
      
    }

    getOneDemande(){
      this.demande = this.demandeService.getOnedemand(this.id).subscribe(
        (data) => {
          this.demande = data ;
          console.log(this.demande)
        }
      );
    }

    setColor(){
      if (this.demande.status == "En cours") {
        return "lightgreen";
      } else if (this.demande.status == "En attente") {
        return "orange";
      }else if (this.demande.status == "Validé") {
        return "green";
      }else if (this.demande.status == "Refusé(e)") {
        return "red";
      } else {
        return "black"
      }
    }

    valider(id:any){
      this.demandeService.valider(id).subscribe(
        (data)=>{
          this.getOneDemande();
        }
      )
      
    }
    refuser(id:any){
      this.demandeService.refuser(id).subscribe(
        (data)=>{
          this.getOneDemande();
        }
      )
    }



}
