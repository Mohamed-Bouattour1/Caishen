import { Component } from '@angular/core';

@Component({
  selector: 'app-header',
  templateUrl: './header.component.html',
  styleUrls: ['./header.component.css']
})
export class HeaderComponent {
  Clients_monitor : any  = [] ;
  Demands_monitor : any = [] ;
  Clients : any  = [] ;
  Demands : any = [] ;

  searchMonitor(event: any) {
    if (event.target.value) {

        this.Clients_monitor = this.Clients.filter((e:any) => e.nom.toLowerCase().includes(event.target.value)||e.prenom.toLowerCase().includes(event.target.value));
        this.Demands_monitor = this.Demands.filter((e:any) => e.type.toLowerCase().includes(event.target.value)||e.status.toLowerCase().includes(event.target.value));
      } else {
        this.Clients_monitor = this.Clients;
      this.Demands_monitor = this.Demands;
      }
     
    } 
}
