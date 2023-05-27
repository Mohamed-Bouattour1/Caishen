import { Controller, Get, Post, Body, Patch, Param, Delete, UseGuards, Req, Res, HttpStatus } from '@nestjs/common';
import {Response} from 'express'
import { SimulationService } from './simulation.service';
import { CreateSimulationDto } from './dto/create-simulation.dto';
import { simulation } from './schemas/simulation.schema';
import { AuthGuard } from '@nestjs/passport';
import { Roles } from 'src/auth/Role.decorator';
import { ERole } from 'src/auth/schemas/ERole.enum';
import { RolesGuard } from 'src/auth/guards/role/role.guard';

@Controller('api/simulation')
export class SimulationController {
  constructor(private readonly simulationService: SimulationService) { }

  @Post()
  @Roles(ERole.Client)
  @UseGuards(RolesGuard)
  @UseGuards(AuthGuard())
  addsim(@Body() simulation: CreateSimulationDto , @Req() req) : Promise<simulation> {
    return this.simulationService.addsim(simulation,req.user);
  }

  @Post('/invite/:imei')
  addsiminv(@Body() simulation: CreateSimulationDto , @Param("imei") imei) : Promise<simulation> {
    return this.simulationService.addsiminv(simulation,imei);
  }
  
  @Get()
  @Roles(ERole.Client)
  @UseGuards(RolesGuard)
  @UseGuards(AuthGuard())
  getAllsim( @Req() req) {
    return this.simulationService.getAllsim(req.user);
  }

  @Get(':id')
  @Roles(ERole.Client)
  @UseGuards(RolesGuard)
  @UseGuards(AuthGuard())
  getOnesim(@Param('id') id: string , @Req() req) {
    return this.simulationService.getOnesim(id,req.user);
  }


 /*  @Patch(':id')
  updatesim(@Param('id') id: string, @Body() simulation: simulation) {
    return this.simulationService.updatesim(id, simulation);
  } */

  @Delete(':id')
  @Roles(ERole.Client)
  @UseGuards(RolesGuard)
  @UseGuards(AuthGuard())
  removesim(@Param('id') id , @Req() req) {
    return this.simulationService.removesim(id,req.user);
  }

  @Get('/getpdf/user/:id')
  @Roles(ERole.Client)
  @UseGuards(RolesGuard)
  @UseGuards(AuthGuard())
  async getPdf(@Res() res: Response, @Param('id') id, @Req() req ) {
    const pdfBytes = await this.simulationService.generateTablePdf(id,req.user);
    console.log(pdfBytes);
  
    res.setHeader('Content-Type', 'application/pdf');
    res.setHeader('Content-Disposition', 'attachment; filename=simulation.pdf');
    return res.status(HttpStatus.OK).send(pdfBytes);
  }



@Get('/getpdf/invite/:id')
  async getPdfinv(@Res() res: Response, @Param('id') id ) {
    console.log(id)
    const pdfBytes = await this.simulationService.generateTablePdfinv(id,"Invité(e)");
    console.log(pdfBytes);
  
    res.setHeader('Content-Type', 'application/pdf');
    res.setHeader('Content-Disposition', 'attachment; filename=simulation.pdf');
    return res.status(HttpStatus.OK).send(pdfBytes);
  }


}
