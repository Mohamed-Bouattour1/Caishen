import { Component } from '@angular/core';
import { ActivatedRoute, Router } from '@angular/router';
import { AgenceService } from '../services/agence.service';
import { FormGroup } from '@angular/forms';

@Component({
  selector: 'app-addupdateagence',
  templateUrl: './addupdateagence.component.html',
  styleUrls: ['./addupdateagence.component.css']
})
export class AddupdateagenceComponent {
  agence: any = {}
  newagence: any = {}

  id: any
  title: string = "Nouvelle Agence"
  constructor(private router: Router, private activatedRoute: ActivatedRoute , private agenceService:AgenceService ) {



  }


  ngOnInit() {
    this.id = this.activatedRoute.snapshot.paramMap.get("Agence_id")
    // if different de null
    if (this.id) {
      this.title = "Modifier Agence"
      this.getAgenceById()

    } 

  }
  validateForm(){
    if (this.id) {
      this.Editagence();
    } else {
      this.addagence();
    }
    this.router.navigate(["dashboard/Agences"]);
  }
  addagence(){
    this.newagence = this.agence
    this.agenceService.addagence(this.newagence).subscribe(
      (data)=>{
        console.log(data);
        this.agenceService.getAllAgencies().subscribe();
      }
    
    );
  }
  Editagence(){
    this.newagence = this.agence
    delete this.newagence._id;
    delete this.newagence.updatedAt;
    this.agenceService.updateagence(this.id,this.newagence).subscribe(
      (data)=>{
        console.log(data);
        this.agenceService.getAllAgencies().subscribe();
      }
    
    );
  }
  getAgenceById(){
    this.agenceService.getOneAgence(this.id).subscribe(
      (data)=>{
        this.agence = data ;
        console.log("hahahahahaha")
        console.log(data)
      }
    
    );
  }

  
}
