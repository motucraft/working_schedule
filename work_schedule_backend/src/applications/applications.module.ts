import { Module } from '@nestjs/common';
import { ApplicationsController } from './applications.controller';
import { ApplicationsService } from './applications.service';
import { TypeOrmModule } from '@nestjs/typeorm';
import { ApplicationsRepository } from './applications.repository';
import User from '../users/user.entity';

@Module({
  controllers: [ApplicationsController],
  providers: [ApplicationsService],
  imports: [
    TypeOrmModule.forFeature([User]),
    TypeOrmModule.forFeature([ApplicationsRepository]),
  ],
})
export class ApplicationsModule {}
