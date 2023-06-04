import { Component } from '@angular/core';
import { DemandeService } from '../services/demande.service';
import { Router } from '@angular/router';

@Component({
  selector: 'app-demandes',
  templateUrl: './demandes.component.html',
  styleUrls: ['./demandes.component.css']
})
export class DemandesComponent {

  Demands : any = [] ;
  Demands_monitor : any = [] ;
    constructor(private readonly demandeService: DemandeService, private readonly router: Router) {}

    ngOnInit() {
        // this.accountService.getAll()
        //     .pipe(first())
        //     .subscribe(users => this.users = users);
   
        this.getAllDemands();
       
      
    }

   

    getAllDemands(){
      //this.matches = JSON.parse(localStorage.getItem("matches") || "[]")
      this.Demands = this.demandeService.getAllDemands().subscribe(
        (data)=>{
          console.log("data")
          console.log(data)
          this.Demands = data ;
          this.Demands_monitor = this.Demands;
        }
      );
      
      }

     

        consulter(demande: any){
            this.router.navigate([`dashboard/demande/${demande._id}`]);
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
