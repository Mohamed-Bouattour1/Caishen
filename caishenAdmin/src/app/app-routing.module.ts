import { NgModule } from '@angular/core';
import { RouterModule, Routes } from '@angular/router';
import { LoginComponent } from './login/login.component';
import { DashboardComponent } from './dashboard/dashboard.component';

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
  },
];

@NgModule({
  imports: [RouterModule.forRoot(routes)],
  exports: [RouterModule]
})
export class AppRoutingModule { }
