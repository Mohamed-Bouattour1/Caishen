import { HttpClient, HttpHeaders } from '@angular/common/http';
import { Injectable } from '@angular/core';
import { UserService } from './user.service';

@Injectable({
  providedIn: 'root'
})
export class DemandeService {

  baseURL = 'http://localhost:3000/api/demande';
  constructor(private readonly http: HttpClient, private readonly userService: UserService ) { }

  getAllDemands(){
    console.log(this.userService.jwtToken)
    return this.http.get(`${this.baseURL}`,{
      headers: new HttpHeaders().append("Authorization",`Bearer ${this.userService.jwtToken}`),
    }
    )
  }
}
