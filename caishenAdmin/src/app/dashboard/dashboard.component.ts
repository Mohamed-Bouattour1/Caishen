import { Component, OnInit } from '@angular/core';
import { first } from 'rxjs/operators';

@Component({
  selector: 'app-dashboard',
  templateUrl: './dashboard.component.html',
  styleUrls: ['./dashboard.component.css']
})
export class DashboardComponent implements OnInit {
  users = null;
  showDemandes: boolean = true;
  activeTab: string = 'matches';
    constructor() {}

    ngOnInit() {
        // this.accountService.getAll()
        //     .pipe(first())
        //     .subscribe(users => this.users = users);
    }

    showTable(state: boolean) {
      this.showDemandes = state;
    }



    deleteUser(id: string) {
        // const user = this.users.find(x => x.id === id);
        // user.isDeleting = true;
        // this.accountService.delete(id)
        //     .pipe(first())
        //     .subscribe(() => this.users = this.users.filter(x => x.id !== id));
    }

}
