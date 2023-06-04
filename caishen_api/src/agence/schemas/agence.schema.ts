import { Prop, Schema, SchemaFactory } from "@nestjs/mongoose"
import mongoose from "mongoose"
import { IMF } from "src/imf/schemas/imf.schema"

@Schema({
    timestamps: true,
  })
  export class Agence {

    @Prop({ type: mongoose.Schema.Types.ObjectId, ref: "IMF" })
    imf: IMF

    @Prop({required:true})
    nom: string
     
    @Prop({required:true})
    adresse: string
     
    @Prop({required:true, unique:true})
    tel: string

    @Prop({required:true, unique:true})
    email: string

    @Prop({required:true})
    lat: string

    @Prop({required:true})
    long: string

   /*  @Prop({required: true})
    contenu: Buffer
 */
  }

  export const AgenceSchema = SchemaFactory.createForClass(Agence);