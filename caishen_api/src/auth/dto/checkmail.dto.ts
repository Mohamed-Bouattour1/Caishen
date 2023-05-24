import { IsEmail, IsNotEmpty} from "class-validator";

export class checkmailDTO {
    @IsNotEmpty()
    @IsEmail()    
    email: string;
}