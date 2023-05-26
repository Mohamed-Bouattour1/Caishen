import { Component, OnInit } from '@angular/core';
import { FormBuilder } from '@angular/forms';
import { AuthService } from '../services/auth.service';
import { Router } from '@angular/router';
import { UserService } from '../services/user.service';
// import { User } from '../user';
// import { UserService } from '../user.service';

@Component({
  selector: 'app-login',
  templateUrl: './login.component.html',
  styleUrls: ['./login.component.css']
})
export class LoginComponent implements OnInit {
  email : string = ""
  mdp : string = ""
  form: any;
   constructor(private authservice:AuthService, private readonly router: Router, private readonly userservice: UserService, private readonly formBuilder: FormBuilder) {}

  ngOnInit(): void {
    this.form = this.formBuilder.group( {
      email: '',
      password: ''
    });
  }
  Login(){
    
    
    if(this.form.value.email && this.form.value.password) {
      this.authservice.login({email: this.form.value.email, mdp: this.form.value.password}).subscribe((req: any) => {
        const token = req.body.token;
        console.log(token);
        if(req.status == 201) {
          this.userservice.setAuth(token);
          console.log(token)
          this.router.navigate(['dashboard']);
        } else {
        }
      }); 
     
    }
// this.userservice.Login(this.user).subscribe(data=>{
//   //if not empty then login successfully
//   console.log(data);
// })
  }

}
