import { HttpClient, HttpHeaders } from '@angular/common/http';
import { Injectable } from '@angular/core';
import { UserService } from './user.service';

@Injectable({
  providedIn: 'root'
})
export class ClientService {

  baseURL = 'http://localhost:3000/api/auth';
  constructor(private readonly http: HttpClient, private readonly userService: UserService ) { }

  getAllClients(){
    return this.http.post(`${this.baseURL}/user/all`,{},{
      headers: new HttpHeaders().append("Authorization",`Bearer ${this.userService.jwtToken}`),
    }
    )
  }

}
