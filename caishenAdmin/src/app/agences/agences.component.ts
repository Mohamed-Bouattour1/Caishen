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
        console.log(data)
        this.agences = data ;
        this.agences_monitor = this.agences;
      }
    );
    
    }

    deleteagence(agence_id:any){
      //this.matches = JSON.parse(localStorage.getItem("matches") || "[]")
      this.agences = this.agenceService.deleteagence(agence_id).subscribe(
        (data:any)=>{
         this.getAllAgencies
        }
      );
      
      }

   

      add(){
        this.router.navigate([`dashboard/Agence`]);
      }
     
        update(agence_id:any){
          this.router.navigate([`dashboard/Agence/${agence_id}`]);
        }
      
        

    
}
