import { Prop, Schema, SchemaFactory } from "@nestjs/mongoose"

@Schema({
    timestamps: true,
  })
  export class IMF {

   
    @Prop({unique: true})
    nom: string
     
    @Prop({unique: true})
    tel: string
     
    @Prop({unique: true})
    mail: string

  }

  export const IMFSchema = SchemaFactory.createForClass(IMF);