import { Component } from '@angular/core';
import { ClientService } from '../services/client.service';
import { DemandeService } from '../services/demande.service';
import { ActivatedRoute, Router } from '@angular/router';

@Component({
  selector: 'app-clidem',
  templateUrl: './clidem.component.html',
  styleUrls: ['./clidem.component.css']
})
export class ClidemComponent {
  id : any 
  demandes : any = []

  constructor(private readonly clientService: ClientService, private readonly demandeService: DemandeService, private activatedRoute: ActivatedRoute, private readonly router: Router) {}

    ngOnInit() {
      this.id = this.activatedRoute.snapshot.paramMap.get("client_id") ;
      console.log(this.id)
      this.getDemandes();
      
    }

    getDemandes(){
      this.demandes = this.demandeService.getDemandeByClient(this.id).subscribe(
        (data) => {
          this.demandes = data ;
          console.log(this.demandes)
        }
      );
    }

    consulter(demande: any){
      this.router.navigate([`demande/${demande._id}`]);
  }

  setColor(obj : any){
    if (obj.status == "En cours") {
      return "lightgreen";
    } else if (obj.status == "En attente") {
      return "orange";
    }else if (obj.status == "Validé") {
      return "green";
    }else if (obj.status == "Refusé(e)") {
      return "red";
    } else {
      return "black"
    }
  }
}

