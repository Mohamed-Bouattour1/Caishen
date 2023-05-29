import { Component, OnInit } from '@angular/core';
import { ClientService } from '../services/client.service';
import { DemandeService } from '../services/demande.service';

@Component({
  selector: 'app-dashboard',
  templateUrl: './dashboard.component.html',
  styleUrls: ['./dashboard.component.css']
})
export class DashboardComponent implements OnInit {
  Clients : any  = [] ;
  Demands : any = [] ;
  Clients_monitor : any  = [] ;
  Demands_monitor : any = [] ;
  showDemandes: boolean = true;
  activeTab: string = 'matches';
    constructor(private readonly clientService: ClientService, private readonly demandeService: DemandeService) {}

    ngOnInit() {
        // this.accountService.getAll()
        //     .pipe(first())
        //     .subscribe(users => this.users = users);
        this.getAllClients();
        this.getAllDemands();
       
      
        console.log(this.Demands)
    }

    getAllClients(){
    //this.matches = JSON.parse(localStorage.getItem("matches") || "[]")
    this.Clients = this.clientService.getAllClients().subscribe(
      (data)=>{
        this.Clients = data ;
        this.Clients_monitor = this.Clients;
      }
    );
    
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

      searchMonitor(event: any) {
        if (event.target.value) {

            this.Clients_monitor = this.Clients.filter((e:any) => e.nom.toLowerCase().includes(event.target.value)||e.prenom.toLowerCase().includes(event.target.value));
            this.Demands_monitor = this.Demands.filter((e:any) => e.type.toLowerCase().includes(event.target.value)||e.status.toLowerCase().includes(event.target.value));
          } else {
            this.Clients_monitor = this.Clients;
          this.Demands_monitor = this.Demands;
          }
         
        } 
      











    showTable(state: boolean) {
      this.showDemandes = state;
    }



    deleteUser(id: string) {
        // const user = this.users.find(x => x.id === id);
        // user.isDeleting = true;
        // this.accountService.delete(id)
        //     .pipe(first())
        //     .subscribe(() => this.users = this.users.filter(x => x.id !== id));
    }

}
