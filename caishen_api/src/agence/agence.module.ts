import { Module } from '@nestjs/common';
import { AgenceService } from './agence.service';
import { AgenceController } from './agence.controller';
import { MongooseModule } from '@nestjs/mongoose';
import { IMF, IMFSchema } from 'src/imf/schemas/imf.schema';
import { Agence, AgenceSchema } from './schemas/agence.schema';
import { AuthModule } from 'src/auth/auth.module';

@Module({
  imports:[
    AuthModule,
    MongooseModule.forFeature([{ name: IMF.name, schema: IMFSchema }]),
    MongooseModule.forFeature([{ name: Agence.name, schema: AgenceSchema }]),
  ],
  providers: [AgenceService,AuthModule],
  controllers: [AgenceController]
})
export class AgenceModule {}
