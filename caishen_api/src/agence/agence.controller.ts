import { Body, Controller, Delete, Get, Param, Patch, Post, UseGuards } from '@nestjs/common';
import { AgenceService } from './agence.service';
import { Roles } from 'src/auth/Role.decorator';
import { ERole } from 'src/auth/schemas/ERole.enum';
import { RolesGuard } from 'src/auth/guards/role/role.guard';
import { AuthGuard } from '@nestjs/passport';
import { AgenceDto } from './dto/agence.dto';
import { Agence } from './schemas/agence.schema';

@Controller('api/agence')
export class AgenceController {

    constructor(private readonly agenceService: AgenceService) { }

    @Post('/:nomimf')
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
    }

}
