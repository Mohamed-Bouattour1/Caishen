import { Prop, Schema, SchemaFactory } from "@nestjs/mongoose";
import  mongoose, { Document } from "mongoose";
import {ERole} from './ERole.enum';
import { EStatus } from "./EStatus.enum";
import { Demande } from "src/demande/schemas/demande.schema";

@Schema({
    timestamps: true,
  })
  export class User extends Document{

    @Prop({required: [true],default:ERole.Client})
    role: ERole

    @Prop({required: [true],default:EStatus.LIBRE})
    status: EStatus

    @Prop({ type: mongoose.Schema.Types.ObjectId, ref: "Demande" })
    dem: Demande

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