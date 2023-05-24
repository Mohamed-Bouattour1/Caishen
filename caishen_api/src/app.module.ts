import { Module } from '@nestjs/common';
import { AppController } from './app.controller';
import { AppService } from './app.service';
import { SimulationModule } from './simulation/simulation.module';
import { MongooseModule } from '@nestjs/mongoose';
import { AuthModule } from './auth/auth.module';
import { ConfigModule } from '@nestjs/config';
import { jwtStrategy } from './auth/jwt.strategy';
import { PassportModule } from '@nestjs/passport';
import { RolesGuard } from 'src/auth/guards/role/role.guard';
import { DemandeModule } from './demande/demande.module';

@Module({
  imports: [
    ConfigModule.forRoot({
      envFilePath: '.env',
      isGlobal: true,
    }),
    SimulationModule,
    MongooseModule.forRoot('mongodb+srv://admin:admin@battoua.73bqqwa.mongodb.net/caishenn?retryWrites=true&w=majority'),
    AuthModule,
    DemandeModule,
  ],
  controllers: [AppController],
  providers: [AppService],
})
export class AppModule {}
