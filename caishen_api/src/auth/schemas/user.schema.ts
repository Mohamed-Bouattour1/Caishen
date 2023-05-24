import { Prop, Schema, SchemaFactory } from "@nestjs/mongoose";
import  { Document } from "mongoose";
import {ERole} from './ERole.enum';
import { EStatus } from "./EStatus.enum";

@Schema({
    timestamps: true,
  })
  export class User extends Document{

    @Prop({required: [true],default:ERole.Client})
    role: ERole

    @Prop({required: [true],default:EStatus.LIBRE})
    status: EStatus

    @Prop({required:[true,"Nom requis"]})
    nom : string

    @Prop({required:[true,"Prenom requis"]})
    prenom : string

    @Prop({required:[true,"CIN requis"],unique:true})
    cin : string

    @Prop({unique : [true,"Email requis"]})
    email : string

    @Prop({required:[true,"Mot de Passe requis"]})
    mdp : string

  }

  export const UserSchema = SchemaFactory.createForClass(User);