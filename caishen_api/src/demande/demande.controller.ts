import { Controller, Get, Post, Body, Patch, Param, Delete, UseGuards, Req } from '@nestjs/common';
import { DemandeService } from './demande.service';
import { CreateDemandeDto } from './dto/create-demande.dto';
import { UpdateDemandeDto } from './dto/update-demande.dto';
import { ERole } from 'src/auth/schemas/ERole.enum';
import { Roles } from 'src/auth/Role.decorator';
import { AuthGuard } from '@nestjs/passport';
import { RolesGuard } from 'src/auth/guards/role/role.guard';
import { DocumentDemande } from './schemas/document_demande.schema';

@Controller('api/demande')
export class DemandeController {
  constructor(private readonly demandeService: DemandeService) {}

  @Post()
  @Roles(ERole.Client)
  @UseGuards(RolesGuard)
  @UseGuards(AuthGuard())
  create(@Body() createDemandeDto: CreateDemandeDto, @Req() req): Promise<DocumentDemande[]> {
    return this.demandeService.create(createDemandeDto, req.user);
  }

  @Get()
  findAll() {
    return this.demandeService.findAll();
  }

  @Get(':id')
  findOne(@Param('id') id: string) {
    return this.demandeService.findOne(+id);
  }

  @Patch(':id')
  update(@Param('id') id: string, @Body() updateDemandeDto: UpdateDemandeDto) {
    return this.demandeService.update(+id, updateDemandeDto);
  }

  @Delete(':id')
  remove(@Param('id') id: string) {
    return this.demandeService.remove(+id);
  }
}
