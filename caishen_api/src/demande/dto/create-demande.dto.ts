import { IsEmpty } from "class-validator";
import { User } from "src/auth/schemas/user.schema";
import { Engagement } from "../schemas/engagement.schema";




export class CreateDemandeDto {
    @IsEmpty({ message: "you cannot pass user id" })
    readonly user: User;
    @IsEmpty({ message: "you cannot pass engagement id" })
    readonly engagement: Engagement;
    type: string;
    mnt_crd: number;
    duree_rnb: number;
    datedeblocage: string
    datepremech: string
    datedepot: string
    daterecep: string
}
