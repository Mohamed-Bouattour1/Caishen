import { IsNotEmpty, MinLength } from "class-validator";

export class resetPassDTO {
    @IsNotEmpty()
    @MinLength(8)
    newpass: string
}