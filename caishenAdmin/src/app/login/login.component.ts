import { Component, OnInit } from '@angular/core';
// import { User } from '../user';
// import { UserService } from '../user.service';

@Component({
  selector: 'app-login',
  templateUrl: './login.component.html',
  styleUrls: ['./login.component.css']
})
export class LoginComponent implements OnInit {
  user!:any;
//   constructor(private userservice:UserService) {
// this.user=new User();
//   }

  ngOnInit(): void {
  }
  Login(){
// this.userservice.Login(this.user).subscribe(data=>{
//   //if not empty then login successfully
//   console.log(data);
// })
    console.log(this.user);
  }

}
