import { Prop, Schema, SchemaFactory } from "@nestjs/mongoose";
import mongoose from "mongoose";
import { Demande } from "./demande.schema";
import { doc } from "./document.schema";
import  { Document } from "mongoose";

@Schema({
    timestamps: true,
  })
  export class DocumentDemande extends Document{

    @Prop({ type: mongoose.Schema.Types.ObjectId, ref: "Demande" })
    demande: Demande

    @Prop({ type: mongoose.Schema.Types.ObjectId, ref: "doc" })
    doc: doc

    @Prop({default: ""})
    titre: string
     
    @Prop({default: ""})
    filename: string
     
    @Prop({default: ""})
    filepath: string

   /*  @Prop({required: true})
    contenu: Buffer
 */
  }

  export const DocumentDemandeSchema = SchemaFactory.createForClass(DocumentDemande);