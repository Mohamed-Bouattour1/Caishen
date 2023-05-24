import { Component, OnInit } from '@angular/core';
// import { User } from '../user';
// import { UserService } from '../user.service';
@Component({
  selector: 'app-forgotpassword',
  templateUrl: './forgotpassword.component.html',
  styleUrls: ['./forgotpassword.component.css']
})
export class ForgotpasswordComponent implements OnInit {
email!:string;
  // constructor(private us:UserService) {
  //   this.email="";
  //  }

  ngOnInit(): void {
  }
ForgotPassword(){
  console.log(this.email);
  // this.us.ForgotPassword(this.email).subscribe(data=>{
  //   //if not empty then login successfully
  //   console.log(data);
  // })

}
}
