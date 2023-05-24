import { Prop, Schema, SchemaFactory } from "@nestjs/mongoose";
import mongoose from "mongoose";
import { User } from "src/auth/schemas/user.schema";
import { Engagement } from "./engagement.schema";

/* enum Type {
  MC = 'Montant Crédit',
  MR = 'Montant Remboursement',
  DR = 'Durée Remboursement'
} */

@Schema(
    {
        
    }
)
export class Demande {

    @Prop()
    date: string

    @Prop({type: mongoose.Schema.Types.ObjectId , ref:"User"})
    user:User

    @Prop()
    type : string

    @Prop({ type: mongoose.Schema.Types.ObjectId, ref: "Engagement" })
    engagement:Engagement

    @Prop()
    mnt_crd:number  //montant credit

    @Prop()
    mnt_rnb:number  //montant remboursement mensuel

    @Prop()
    duree_rnb:number  //duree remboursement

    @Prop({default:1})
    periodicite:number //taux appliqué = TMM+8%

    @Prop({default:0.08})
    taux_app:number //taux appliqué = TMM+8%

    @Prop({default:12})
    nbr_periodes:number 

    @Prop()
    taux_periodique:number //taux appliqué = TMM+8%

    @Prop()
    nbr_echeances:number //taux appliqué = TMM+8%

    @Prop()
    montant_rnb_total:number  //montant remboursement total

    @Prop()
    createdAt : string

    @Prop()
    datedeblocage : string

    @Prop()
    datepremech : string

    @Prop()
    datedepot : string

    @Prop()
    daterecep : string

   
}
export const DemandeSchema = SchemaFactory.createForClass(Demande);