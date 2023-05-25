import { Controller, Get, Post, Body, Patch, Param, Delete, UseGuards, Req, UseInterceptors, UploadedFile } from '@nestjs/common';
import { DemandeService } from './demande.service';
import { CreateDemandeDto } from './dto/create-demande.dto';
import { UpdateDemandeDto } from './dto/update-demande.dto';
import { ERole } from 'src/auth/schemas/ERole.enum';
import { Roles } from 'src/auth/Role.decorator';
import { AuthGuard } from '@nestjs/passport';
import { RolesGuard } from 'src/auth/guards/role/role.guard';
import { DocumentDemande } from './schemas/document_demande.schema';
import { FileInterceptor } from '@nestjs/platform-express';
import { diskStorage } from 'multer';
import { extname } from 'path';
import { createDocDTO } from './dto/createdoc.dto';

@Controller('api/demande')
export class DemandeController {
  constructor(private readonly demandeService: DemandeService) {}

  @Post()
  @Roles(ERole.Client)
  @UseGuards(RolesGuard)
  @UseGuards(AuthGuard())
  create(@Body() createDemandeDto: CreateDemandeDto, @Req() req): Promise<string[]> {
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

  @Post('/file/:title')
  @Roles(ERole.Client)
  @UseGuards(RolesGuard)
  @UseGuards(AuthGuard())
  @UseInterceptors(
    FileInterceptor('file', {
      storage: diskStorage({
        destination: './uploads',
        filename: (req, file, callback) => {
          const uniqueSuffix =
            Date.now() + '-' + Math.round(Math.random() * 1e9);
          const ext = extname(file.originalname);
          const filename = `${uniqueSuffix}${ext}`;
          callback(null, filename);
        },
      }),
    }),
  )
  handleUpload(@UploadedFile() file: Express.Multer.File, @Req() req, @Param('title') title) {
    console.log('file', file);
    this.demandeService.handleUpload(title, file, req.user)
    return 'File upload API';
  }

  @Post('/doc')
  adddoc(@Body() doc: createDocDTO ){
    this.demandeService.adddoc(doc)
  }
}
