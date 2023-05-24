import { IsEmail, IsNotEmpty, Length, MinLength } from "class-validator";

export class SignUpDto {
    @IsNotEmpty()
    nom: string;
    @IsNotEmpty()
    prenom: string;
    @IsNotEmpty()
    @Length(8,8)
    cin: string;
    @IsNotEmpty()
    @IsEmail()    
    email: string;
    @MinLength(8)
    @IsNotEmpty()
    mdp: string
}
