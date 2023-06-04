import { Component } from '@angular/core';
import { AgenceService } from '../services/agence.service';
import { Router } from '@angular/router';

@Component({
  selector: 'app-agences',
  templateUrl: './agences.component.html',
  styleUrls: ['./agences.component.css']
})
export class AgencesComponent {
  agences : any  = [] ;
  agences_monitor : any  = [] ;
    constructor(private readonly agenceService: AgenceService, private readonly router: Router) {}

    ngOnInit() {
        // this.accountService.getAll()
        //     .pipe(first())
        //     .subscribe(users => this.users = users);
        this.getAllAgencies();
       
      
    }

    getAllAgencies(){
    //this.matches = JSON.parse(localStorage.getItem("matches") || "[]")
    this.agences = this.agenceService.getAllAgencies().subscribe(
      (data:any)=>{
        this.agences = data ;
        this.agences_monitor = this.agences;
      }
    );
    
    }

   

     
     
        consultercli(client_id:any){
          this.router.navigate([`dashboard/clidem/${client_id}`]);
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
