import { Module } from '@nestjs/common';
import { DemandeService } from './demande.service';
import { DemandeController } from './demande.controller';
import { AuthModule } from 'src/auth/auth.module';
import { Demande, DemandeSchema } from './schemas/demande.schema';
import { MongooseModule } from '@nestjs/mongoose';
import { doc, docSchema } from './schemas/document.schema';
import { DocumentDemande, DocumentDemandeSchema } from './schemas/document_demande.schema';
import { Engagement, EngagementSchema } from './schemas/engagement.schema';

@Module({
  imports: [
    AuthModule,
    MongooseModule.forFeature([{ name: Demande.name, schema: DemandeSchema }]),
    MongooseModule.forFeature([{ name: doc.name, schema: docSchema }]),
    MongooseModule.forFeature([{ name: DocumentDemande.name, schema: DocumentDemandeSchema }]),
    MongooseModule.forFeature([{ name: Engagement.name, schema: EngagementSchema }]),
  ],
  controllers: [DemandeController],
  providers: [DemandeService,AuthModule]
})
export class DemandeModule {}
