import { IsNumber , IsEmpty } from "class-validator";
import { User } from "src/auth/schemas/user.schema";

export class CreateSimulationDto {
  @IsEmpty({message:"you cannot pass user id"})
  readonly user : User ;
 mnt_crd : number ;
 mnt_rnb : number ;
 duree_rnb : number;
}
