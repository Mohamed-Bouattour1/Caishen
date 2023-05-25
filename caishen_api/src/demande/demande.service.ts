import { Injectable, NotFoundException } from '@nestjs/common';
import { CreateDemandeDto } from './dto/create-demande.dto';
import { UpdateDemandeDto } from './dto/update-demande.dto';
import { User } from 'src/auth/schemas/user.schema';
import { Model, ObjectId } from 'mongoose';
import mongoose from "mongoose";
import { EStatus } from "../auth/schemas/EStatus.enum";
import { InjectModel } from '@nestjs/mongoose';
import { doc } from './schemas/document.schema';
import { Engagement } from './schemas/engagement.schema';
import { DocumentDemande } from './schemas/document_demande.schema';
import { Demande } from './schemas/demande.schema';
import { createDocDTO } from './dto/createdoc.dto';

@Injectable()
export class DemandeService {

  constructor(
    @InjectModel(Demande.name) private DemandeModel: Model<Demande>,
    @InjectModel(doc.name) private docModel: Model<doc>,
    @InjectModel(DocumentDemande.name) private docdemModel: Model<DocumentDemande>,
    @InjectModel(Engagement.name) private engagementModel: Model<Engagement>,
    ) { }


  async create(createDemandeDto: CreateDemandeDto, user: User): Promise<string[]> {

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
      user.dem = demande;
      user.status = EStatus.EN_ATTENTE;
      await user.save();
      await this.createDocsByEng(createddem._id,docs);
         return await this.getDocsTitleByEng(docs)
    }
 

  }
  async getDocsByEng(eng: ObjectId): Promise<doc[]>{
    return await this.docModel.find({engagement: eng}).exec()
  }

  async findEngByNoun(nom: string): Promise<Engagement>{
    return await this.engagementModel.findOne({nom:nom}).exec()
  } 

  async getDocsTitleByEng(docs: doc[]): Promise<string[]>{
    let titles = []
    for (const doc of docs){
      titles.push(doc.titre)
    }
    return titles
  }

  async handleUpload(title: string, file: Express.Multer.File, user: User){
    console.log("titre")
    console.log(title)
    console.log("demande user")
    console.log(user.dem)
    const dema = await this.DemandeModel.findOne({_id: user.dem})
    console.log(dema)
    console.log("eng")
    const eng = await this.engagementModel.findOne({nom: dema.type})
    console.log(eng)
    const doc = await this.docModel.findOne({engagement: eng, titre:title}).exec()
    const docdem = await this.docdemModel.findOne({demande: user.dem, doc:doc }).exec();
    console.log("doc dem")
    console.log(docdem)
    console.log(docdem.filename)
    console.log(file.originalname)
    console.log(file.path)
    docdem.filename = file.originalname
    docdem.filepath = file.path;
    
    console.log(docdem.save());
  }

  async createDocsByEng(demande: mongoose.Types.ObjectId, docs: doc[]){
    for (const doc of docs){
      await new this.docdemModel({demande: demande, doc: doc._id, filename:"", filepath:""}).save()
    }
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


  async adddoc(createdocdto: createDocDTO){

    
    const eng = (await this.engagementModel.findOne({nom: createdocdto["eng"]}))._id;
    const titre = createdocdto["titre"];
    const doc = await new this.docModel({engagement: eng, titre: titre})
    console.log(doc)
    doc.save();
  } 


}
