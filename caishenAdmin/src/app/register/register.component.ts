import { Component, OnInit } from '@angular/core';
// import { UserService } from '../user.service';
// import { User } from '../user';
@Component({
  selector: 'app-register',
  templateUrl: './register.component.html',
  styleUrls: ['./register.component.css']
})
export class RegisterComponent implements OnInit {

  // constructor(private userservice:UserService) {
  //   this.user=new User();
  //     }
  user!:any;
  ngOnInit(): void {
  }
  Register(){
    // this.userservice.Register(this.user).subscribe(data=>{
    //   //
    //   console.log(data);
    // })
        console.log(this.user);
      }

}
