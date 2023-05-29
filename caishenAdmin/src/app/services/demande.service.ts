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
    return this.http.get(`${this.baseURL}`,{
      headers: new HttpHeaders().append("Authorization",`Bearer ${this.userService.jwtToken}`),
    }
    )
  }
  getOnedemand(id : any){
    return this.http.post(`${this.baseURL}/dem`,{"id":`${id}`},{
      headers: new HttpHeaders().append("Authorization",`Bearer ${this.userService.jwtToken}`),
    }
    )
  }

  valider(id : any){
    console.log(id)
    return this.http.patch(`${this.baseURL}/action/valide/${id}`,{},{
      headers: new HttpHeaders().append("Authorization",`Bearer ${this.userService.jwtToken}`),
    }
    )
  }

  refuser(id : any){
    return this.http.patch(`${this.baseURL}/action/refuse/${id}`,{},{
      headers: new HttpHeaders().append("Authorization",`Bearer ${this.userService.jwtToken}`),
    }
    )
  }
}
