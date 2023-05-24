import { Module } from '@nestjs/common';
import { SimulationService } from './simulation.service';
import { SimulationController } from './simulation.controller';
import { MongooseModule } from '@nestjs/mongoose';
import { simulation, simulationSchema } from './schemas/simulation.schema';
import { AuthModule } from '../auth/auth.module';

@Module({
  imports: [
    AuthModule,
    MongooseModule.forFeature([{ name: simulation.name, schema: simulationSchema }]),
  ],
  controllers: [SimulationController],
  providers: [SimulationService,AuthModule]
})
export class SimulationModule {}
