import { NgModule } from '@angular/core';
import { RouterModule, Routes } from '@angular/router';
import { LoginComponent } from './login/login.component';
import { DashboardComponent } from './dashboard/dashboard.component';
import { DemandeComponent } from './demande/demande.component';
import { ClidemComponent } from './clidem/clidem.component';
import { ClientsComponent } from './clients/clients.component';
import { DemandesComponent } from './demandes/demandes.component';
import { AgencesComponent } from './agences/agences.component';

const routes: Routes = [
  {
    path: '',
    component: LoginComponent,
    data: { animation: 'Login' },
  },
  {
    path: 'Login',
    component: LoginComponent,
    data: { animation: 'Login' },
  },
  {
    path: 'dashboard',
    component: DashboardComponent,
    data: { animation: 'dashboard' },
    children:[
      {
    path: 'Clients',
    component: ClientsComponent,
    data: { animation: 'Clients' },
  },
  {
    path: 'clidem/:client_id',
    component: ClidemComponent,
    data: { animation: 'Client' },
  },
  {
    path: 'demandes',
    component: DemandesComponent,
    data: { animation: 'demandes' },
  },
  {
    path: 'demande/:dem',
    component: DemandeComponent,
    data: { animation: 'demande' },
  },
  {
    path: 'Agences',
    component: AgencesComponent,
    data: { animation: 'Agences' },
  },
    ]
  },
  
  
 
  
];

@NgModule({
  imports: [RouterModule.forRoot(routes)],
  exports: [RouterModule]
})
export class AppRoutingModule { }
