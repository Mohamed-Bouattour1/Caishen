import { Prop, Schema, SchemaFactory } from "@nestjs/mongoose";
import mongoose from "mongoose";
import { Engagement } from "./engagement.schema";
import  { Document } from "mongoose";

@Schema({
    timestamps: true,
  })
  export class doc extends Document{

    @Prop({ type: mongoose.Schema.Types.ObjectId, ref: "Engagement" })
    engagement:Engagement

    @Prop()
    titre : string

  }

  export const docSchema = SchemaFactory.createForClass(doc);