import { Injectable, Logger } from '@nestjs/common';
import { CreateApplicationDto } from './dto/create-application.dto';
import { InjectRepository } from '@nestjs/typeorm';
import { Application } from './application.entity';
import { Repository } from 'typeorm';
import { ApplicationsRepository } from './applications.repository';
import User from '../users/user.entity';
import { GetApplicationsByDurationDto } from './dto/get-applications-by-duration.dto';

@Injectable()
export class ApplicationsService {
  private readonly logger = new Logger(ApplicationsService.name, true);

  constructor(
    @InjectRepository(User)
    private usersRepository: Repository<User>, // private readonly filesService: FilesService
    @InjectRepository(ApplicationsRepository)
    private applicationRepository: ApplicationsRepository,
  ) {}

  async getApplicationsByDuration(
    id: number,
    durationDto: GetApplicationsByDurationDto,
  ): Promise<Application[]> {
    const user = await this.usersRepository.findOne({ id: id });
    this.logger.debug(JSON.stringify(user));
    return await this.applicationRepository.findByUserIdAndDuration(
      user.userId,
      durationDto,
    );
  }

  async getApplications(id: number): Promise<Application[]> {
    const user = await this.usersRepository.findOne({ id: id });
    this.logger.debug(JSON.stringify(user));
    return await this.applicationRepository.findByUserId(user.userId);
  }

  async createApplication(createApplicationDto: CreateApplicationDto) {
    this.logger.debug('createApplication');
    this.logger.debug(createApplicationDto);

    await this.applicationRepository.createApplication(createApplicationDto);
  }

  async deleteApplicationByWorkingDay(
    workingDay: string,
    id: number,
  ): Promise<Application> {
    const user = await this.usersRepository.findOne({ id: id });
    this.logger.debug(JSON.stringify(user));
    return await this.applicationRepository.deleteApplicationByWorkingDay(
      workingDay,
      user.userId,
    );
  }
}
