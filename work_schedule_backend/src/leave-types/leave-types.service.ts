import { Injectable, Logger } from '@nestjs/common';
import { InjectRepository } from '@nestjs/typeorm';
import { Repository } from 'typeorm';
import { LeaveType } from './leave-type.entity';

@Injectable()
export class LeaveTypesService {
  private readonly logger = new Logger(LeaveTypesService.name, true);

  constructor(
    @InjectRepository(LeaveType)
    private leaveTypeRepository: Repository<LeaveType>, // private readonly filesService: FilesService
  ) {}

  async find(): Promise<LeaveType[]> {
    return await this.leaveTypeRepository.find();
  }
}
