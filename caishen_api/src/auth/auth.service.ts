import { Injectable, UnauthorizedException } from '@nestjs/common';
import { InjectModel } from '@nestjs/mongoose';
import { User } from './schemas/user.schema';
import { Model } from 'mongoose';
import { SignUpDto } from './dto/signup-user.dto';
import * as bcrypt from 'bcryptjs'
import { JwtService } from '@nestjs/jwt';
import { LoginDto } from './dto/login-user.dto';
import { checkmailDTO } from './dto/checkmail.dto';
import { Invite } from './schemas/invite.schema';
import { resetPassDTO } from './dto/resetpass.dto';

@Injectable()
export class AuthService {
    constructor(
        @InjectModel(User.name)
         private userModel: Model<User>,
         @InjectModel(Invite.name)
         private invModel: Model<Invite>,
         private jwtService:JwtService
         ){}

         async signup(signupdto: SignUpDto) : Promise<{token : string}>{
            const {nom , prenom , cin , email , mdp} = signupdto;

            const hashedmdp = await bcrypt.hash(mdp,10);

            const user = await this.userModel.create({
                nom , 
                prenom , 
                cin , 
                email , 
                mdp: hashedmdp,
            });

            const token = this.jwtService.sign({id:user._id, role: user.role, nom:user.nom, prenom:user.prenom});
            
            return { token };

         }

         async login(logindto: LoginDto) : Promise<{token : string}>{
            const {email , mdp} = logindto ;
            const user = await this.userModel.findOne({email});
            if (!user){
                throw new UnauthorizedException('Email ou Mot de Passe incorrect');
            }

            const ismdpmatch = await bcrypt.compare(mdp , user.mdp)
            if (!ismdpmatch){
                throw new UnauthorizedException('Email ou Mot de Passe incorrect');
            }

            const token = this.jwtService.sign({id:user._id, role: user.role, nom:user.nom, prenom:user.prenom});
            
            return { token };
         }


         async resetPass(newpassdto: resetPassDTO, user:User) : Promise<boolean>{
            if (!user) {
                throw new UnauthorizedException('Something went wrong');
            }
            const {newpass} = newpassdto;
            const newhashedmdp = await bcrypt.hash(newpass,10);
            user.mdp = newhashedmdp;
            await user.save();
            return true;
         }



         async checkmail(checkmail: checkmailDTO) : Promise<{token : string}>{
            const {email} = checkmail ;
            const user = await this.userModel.findOne({email});
            if (!user){
                throw new UnauthorizedException('Email n\'existe pas');
            }
            
            const token = this.jwtService.sign({id:user._id});
            
            return { token };
        }

        async createInvt(imei: number) : Promise<Invite>{


            let inv = await this.invModel.findOne({imei});
            if (!inv) {
                inv = await this.invModel.create({imei});
                return inv;
            }
            return inv;


        }
}
