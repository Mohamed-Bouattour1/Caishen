import { Injectable } from '@angular/core';
import {HttpClient, HttpHeaders} from '@angular/common/http';
import {Observable} from 'rxjs';

@Injectable({
  providedIn: 'root'
})
export class AuthService {
  baseURL = 'http://localhost:3000/api/auth';
  constructor(private readonly http: HttpClient) { }

  login(user: {email: string, mdp: string}): Observable<any> {
    return this.http.post<any>(`${this.baseURL}/login`, 
    
      user
   ,
    {
      headers: new HttpHeaders().append('content-type', 'application/json'),
      observe: 'response'
    }
    )
  }

  register(user:{nom: string, prenom: string, cin: string, email: string, mdp: string}): Observable<any>{
    return this.http.post<any>(`${this.baseURL}/signup`,
    
    user
    ,
    {
      headers: new HttpHeaders().append('content-type', 'application/json'),
      observe: 'response'
    }
    )
  }
  mails(email:string[]): Observable<any>{
    return this.http.post<any>(`${this.baseURL}/mail/${email}`, 
    {
      headers: new HttpHeaders().append('content-type', 'application/json'),
      observe: 'response'
    }
    
    )
  }
  newPassword(newpassword:string[],mail:string[]):Observable<any>{
    return this.http.put<any>(`${this.baseURL}/newpassword/${mail}`,
    newpassword,
    {
      headers: new HttpHeaders().append('content-type', 'application/json'),
      observe: 'response'
    }
    )
  }
}
