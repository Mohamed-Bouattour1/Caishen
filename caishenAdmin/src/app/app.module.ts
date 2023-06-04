import { NgModule } from '@angular/core';
import { BrowserModule } from '@angular/platform-browser';

import { AppRoutingModule } from './app-routing.module';
import { AppComponent } from './app.component';
import { FormsModule, ReactiveFormsModule } from '@angular/forms';
import { HttpClientModule } from '@angular/common/http';

import { LoginComponent } from './login/login.component';
import { DashboardComponent } from './dashboard/dashboard.component';
import { DemandeComponent } from './demande/demande.component';
import { ClidemComponent } from './clidem/clidem.component';
import { HeaderComponent } from './header/header.component';
import { ClientsComponent } from './clients/clients.component';
import { DemandesComponent } from './demandes/demandes.component';
import { AgencesComponent } from './agences/agences.component';


@NgModule({
  declarations: [
    AppComponent,
    LoginComponent,
    DashboardComponent,
    DemandeComponent,
    ClidemComponent,
    HeaderComponent,
    ClientsComponent,
    DemandesComponent,
    AgencesComponent,
  
  ],
  imports: [
    BrowserModule, AppRoutingModule, FormsModule , HttpClientModule, ReactiveFormsModule
  ],
  providers: [],
  bootstrap: [AppComponent]
})
export class AppModule { }
