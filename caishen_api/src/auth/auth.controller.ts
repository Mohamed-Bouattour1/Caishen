import { Body, Controller, Post, Req, UseGuards } from '@nestjs/common';
import { AuthService } from './auth.service';
import { SignUpDto } from './dto/signup-user.dto';
import { LoginDto } from './dto/login-user.dto';
import { checkmailDTO } from './dto/checkmail.dto';
import { AuthGuard } from '@nestjs/passport';
import { resetPassDTO } from './dto/resetpass.dto';

@Controller('api/auth')
export class AuthController {
    constructor(private authservice:AuthService ){}

    @Post('/signup')
    signup(@Body() signupdto:SignUpDto ) : Promise<{token : string}>{
        return this.authservice.signup(signupdto);
    }

    @Post('/login')
    login(@Body() logindto:LoginDto ) : Promise<{token : string}>{
        return this.authservice.login(logindto);
    }
    @Post('/checkmail')
    checkmail(@Body() checkmail:checkmailDTO ) : Promise<{token : string}>{
        return this.authservice.checkmail(checkmail);
    }
    @Post('/resetpass')
    @UseGuards(AuthGuard())
    resetpass(@Body() resetpassdto: resetPassDTO, @Req() req ) : Promise<boolean>{
        return this.authservice.resetPass(resetpassdto,req.user);
    }
}
