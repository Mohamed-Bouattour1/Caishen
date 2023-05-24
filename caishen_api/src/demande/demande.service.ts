import { Injectable, NotFoundException } from '@nestjs/common';
import { CreateDemandeDto } from './dto/create-demande.dto';
import { UpdateDemandeDto } from './dto/update-demande.dto';
import { User } from 'src/auth/schemas/user.schema';
import { Model, ObjectId } from 'mongoose';
import mongoose from "mongoose";

import { InjectModel } from '@nestjs/mongoose';
import { doc } from './schemas/document.schema';
import { Engagement } from './schemas/engagement.schema';
import { DocumentDemande } from './schemas/document_demande.schema';
import { Demande } from './schemas/demande.schema';

@Injectable()
export class DemandeService {

  constructor(
    @InjectModel(Demande.name) private DemandeModel: Model<Demande>,
    @InjectModel(doc.name) private docModel: Model<doc>,
    @InjectModel(DocumentDemande.name) private docdemModel: Model<DocumentDemande>,
    @InjectModel(Engagement.name) private engagementModel: Model<Engagement>,
    ) { }


  async create(createDemandeDto: CreateDemandeDto, user: User): Promise<DocumentDemande[]> {

    const eng = await this.findEngByNoun(createDemandeDto["type"])
    if (!eng) {
      throw new NotFoundException('Engagement non existant')
    }
    const data = Object.assign({ user: user._id, engagement: eng._id }, createDemandeDto);
    const createddem = await new this.DemandeModel(data);
    createddem.date = (" "+new Date().toISOString()).substring(0,10);
    const docs = await this.getDocsByEng(createddem.engagement._id);
    if (!docs) {
      throw new NotFoundException('documents non existants pour cet engagement')
    }

    const demande = await createddem.save();
    if(demande) {
         return await this.createDocsByEng(demande._id,docs)
    }
 

  }
  async getDocsByEng(eng: ObjectId): Promise<doc[]>{
    return await this.docModel.find({engagement: eng}).exec()
  }

  async findEngByNoun(nom: string): Promise<Engagement>{
    return await this.engagementModel.findOne({nom:nom}).exec()
  } 

  async createDocsByEng(demande: mongoose.Types.ObjectId, docs: doc[]): Promise<DocumentDemande[]>{
    let docsdem = []
    for (const doc of docs){
      docsdem.push(await new this.docdemModel({demande: demande, doc: doc._id}).save())
    }
    return docsdem
  }
  

  findAll() {
    return `This action returns all demande`;
  }

  findOne(id: number) {
    return `This action returns a #${id} demande`;
  }

  update(id: number, updateDemandeDto: UpdateDemandeDto) {
    return `This action updates a #${id} demande`;
  }

  remove(id: number) {
    return `This action removes a #${id} demande`;
  }
}
