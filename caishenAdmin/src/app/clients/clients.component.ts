import { Component } from '@angular/core';
import { ClientService } from '../services/client.service';
import { Router } from '@angular/router';

@Component({
  selector: 'app-clients',
  templateUrl: './clients.component.html',
  styleUrls: ['./clients.component.css']
})
export class ClientsComponent {

  Clients : any  = [] ;
  Clients_monitor : any  = [] ;
    constructor(private readonly clientService: ClientService, private readonly router: Router) {}

    ngOnInit() {
        // this.accountService.getAll()
        //     .pipe(first())
        //     .subscribe(users => this.users = users);
        this.getAllClients();
       
      
    }

    getAllClients(){
    //this.matches = JSON.parse(localStorage.getItem("matches") || "[]")
    this.Clients = this.clientService.getAllClients().subscribe(
      (data:any)=>{
        this.Clients = data ;
        this.Clients_monitor = this.Clients;
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
