import { HttpClient, HttpHeaders } from '@angular/common/http';
import { Injectable } from '@angular/core';
import { UserService } from './user.service';

@Injectable({
  providedIn: 'root'
})
export class AgenceService {

  baseURL = 'http://localhost:3000/api/agence';
  constructor(private readonly http: HttpClient, private readonly userService: UserService ) { }

  addagence(agence:any){
    return this.http.post(`${this.baseURL}/test`,agence,{
      headers: new HttpHeaders().append("Authorization",`Bearer ${this.userService.jwtToken}`),
    }
    )
  }
  updateagence(id: any, agence:any){
    return this.http.patch(`${this.baseURL}/${id}`,agence,{
      headers: new HttpHeaders().append("Authorization",`Bearer ${this.userService.jwtToken}`),
    }
    )
  }

  deleteagence(id: any){
    return this.http.delete(`${this.baseURL}/${id}`,{
      headers: new HttpHeaders().append("Authorization",`Bearer ${this.userService.jwtToken}`),
    }
    )
  }

  getAllAgencies(){
    return this.http.get(`${this.baseURL}/test`,{
      headers: new HttpHeaders().append("Authorization",`Bearer ${this.userService.jwtToken}`),
    }
    )
  }

}
/* @Post('/:nomimf')
    @Roles(ERole.Admin)
    @UseGuards(RolesGuard)
    @UseGuards(AuthGuard())
    addagence(@Body() agence: AgenceDto , @Param('nomimf') nomimf) : Promise<Agence> {
      return this.agenceService.newAgence(nomimf,agence);
    }

    @Patch('/:id')
    @Roles(ERole.Admin)
    @UseGuards(RolesGuard)
    @UseGuards(AuthGuard())
    updateagence(@Body() agence: AgenceDto , @Param('id') id) : Promise<Agence> {
      return this.agenceService.updateagence(id,agence);
    }

    @Delete('/:id')
    @Roles(ERole.Admin)
    @UseGuards(RolesGuard)
    @UseGuards(AuthGuard())
    deleteagence(@Param('id') id) : Promise<Agence> {
      return this.agenceService.deleteagence(id);
    }

    @Get('/:nomimf')
    @UseGuards(AuthGuard())
    getAllAgencies(@Param('nomimf') nomimf) : Promise<Agence[]> {
      return this.agenceService.getAllAgencies(nomimf);
    } */