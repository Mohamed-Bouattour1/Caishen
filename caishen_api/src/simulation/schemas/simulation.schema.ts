import { Prop, Schema, SchemaFactory } from "@nestjs/mongoose";
import mongoose from "mongoose";
import { User } from "src/auth/schemas/user.schema";
import { Invite } from "src/auth/schemas/invite.schema";

enum Type {
  MC = 'Montant Crédit',
  MR = 'Montant Remboursement',
  DR = 'Durée Remboursement'
}

@Schema()
export class simulation {

  /*  @Prop()
  numsmf:number */  //numero simulation
  /* @Prop({unique:true , _id:true})
  idSimulation : string */
  @Prop({ type: mongoose.Schema.Types.ObjectId, ref: "User" })
  user: User

  @Prop({ type: mongoose.Schema.Types.ObjectId, ref: "Invite" })
  invite: Invite
  
  @Prop({ enum: Type })
  type: string

  @Prop()
  mnt_crd: number  //montant credit

  @Prop()
  mnt_rnb: number  //montant remboursement mensuel

  @Prop()
  duree_rnb: number  //duree remboursement
  @Prop({ default: 1 })
  periodicite: number //taux appliqué = TMM+8%

  @Prop({ default: 0.08 })
  taux_app: number //taux appliqué = TMM+8%

  @Prop({ default: 12 })
  nbr_periodes: number

  @Prop()
  taux_periodique: number //taux appliqué = TMM+8%

  @Prop()
  nbr_echeances: number //taux appliqué = TMM+8%

  @Prop()
  montant_rnb_total: number  //montant remboursement total

  @Prop()
  createdAt: string


}
export const simulationSchema = SchemaFactory.createForClass(simulation);