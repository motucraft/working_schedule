import { Module } from '@nestjs/common';
import { TypeOrmModule } from '@nestjs/typeorm';
import { LeaveTypesController } from './leave-types.controller';
import { LeaveTypesService } from './leave-types.service';
import { LeaveType } from './leave-type.entity';

@Module({
  controllers: [LeaveTypesController],
  providers: [LeaveTypesService],
  imports: [TypeOrmModule.forFeature([LeaveType])],
})
export class LeaveTypeModule {}
