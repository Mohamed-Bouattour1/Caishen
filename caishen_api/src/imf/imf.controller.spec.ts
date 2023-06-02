import { Test, TestingModule } from '@nestjs/testing';
import { ImfController } from './imf.controller';

describe('ImfController', () => {
  let controller: ImfController;

  beforeEach(async () => {
    const module: TestingModule = await Test.createTestingModule({
      controllers: [ImfController],
    }).compile();

    controller = module.get<ImfController>(ImfController);
  });

  it('should be defined', () => {
    expect(controller).toBeDefined();
  });
});
