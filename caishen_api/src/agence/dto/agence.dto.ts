import { IsNotEmpty } from "class-validator";

export class AgenceDto {

    @IsNotEmpty()
    nom: string;
    @IsNotEmpty()
    nom_imf: string;
    @IsNotEmpty()
    adresse: number;
    @IsNotEmpty()
    tel: number;
    @IsNotEmpty()
    email: string
    @IsNotEmpty()
    lat: string
    @IsNotEmpty()
    long: string
}
