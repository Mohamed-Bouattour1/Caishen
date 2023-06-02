import { Module } from '@nestjs/common';
import { ImfController } from './imf.controller';
import { ImfService } from './imf.service';
import { MongooseModule } from '@nestjs/mongoose';
import { IMF, IMFSchema } from './schemas/imf.schema';

@Module({
  imports: [
    MongooseModule.forFeature([{ name: IMF.name, schema: IMFSchema }]),
  ],
  controllers: [ImfController],
  providers: [ImfService]
})
export class ImfModule {}
