import { IsNotEmpty } from "class-validator";

export class AgenceDto {

    @IsNotEmpty()
    nom: string;
    @IsNotEmpty()
    adresse: number;
    @IsNotEmpty()
    tel: number;
    @IsNotEmpty()
    mail: string
    @IsNotEmpty()
    lat: string
    @IsNotEmpty()
    long: string
}
