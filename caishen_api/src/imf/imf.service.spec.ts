import { Test, TestingModule } from '@nestjs/testing';
import { ImfService } from './imf.service';

describe('ImfService', () => {
  let service: ImfService;

  beforeEach(async () => {
    const module: TestingModule = await Test.createTestingModule({
      providers: [ImfService],
    }).compile();

    service = module.get<ImfService>(ImfService);
  });

  it('should be defined', () => {
    expect(service).toBeDefined();
  });
});
