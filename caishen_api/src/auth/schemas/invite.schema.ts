import { Prop, Schema, SchemaFactory } from "@nestjs/mongoose";
import  { Document } from "mongoose";
import {ERole} from './ERole.enum';

@Schema({
    timestamps: true,
  })
  export class Invite extends Document{

    @Prop({required:[true,"IMEI requis"],unique:true})
    imei : string

  }

  export const InviteSchema = SchemaFactory.createForClass(Invite);