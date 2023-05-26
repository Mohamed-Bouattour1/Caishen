import { Injectable } from '@angular/core';
import { StorageService } from './storage.service';
import { BehaviorSubject } from 'rxjs';
import jwt_decode from 'jwt-decode';
import { Router } from '@angular/router';


@Injectable({
  providedIn: 'root'
})


export class UserService {

  jwtToken: string | null = "";
  isAuth: BehaviorSubject<Boolean> = new BehaviorSubject<Boolean>(false);

  constructor(private storage: StorageService, private readonly router: Router) {
    this.jwtToken = this.storage.getSetting('jwt') ? this.storage.getSetting('jwt') : "";
    // Check if jwt token is in localstorage
    if (this.storage.getSetting('jwt')) {
      this.router.navigate(['dash']);
      this.isAuth.next(true);
    }
  }


  getUserInfo() {
    if (this.jwtToken) {
      const decoded_token = jwt_decode(this.jwtToken);
      console.log(decoded_token);
      return decoded_token;
    } else {
      console.error('user not signed in');
      return null;
    }
  }

  setAuth(token: string) {
    this.storage.setSetting('jwt', token);
    this.jwtToken = token;
    this.isAuth.next(true);
  }

  unAuth() {
    this.storage.removeSetting('jwt');
    this.isAuth.next(false);
    this.jwtToken = "";
    this.router.navigate(['login']);
  }

}
