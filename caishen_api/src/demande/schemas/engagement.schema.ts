import { Prop, Schema, SchemaFactory } from "@nestjs/mongoose";
import  { Document } from "mongoose";

@Schema({
    timestamps: true,
  })
  export class Engagement extends Document{

    @Prop({unique:true})
    nom : string

  }

  export const EngagementSchema = SchemaFactory.createForClass(Engagement);