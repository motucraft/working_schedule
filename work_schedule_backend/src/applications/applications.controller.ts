import {
  Body,
  Controller,
  Delete,
  Get,
  Logger,
  Param,
  Post,
  Query,
  Req,
  UseGuards,
  ValidationPipe,
} from '@nestjs/common';
import { ApplicationDto } from './dto/application.dto';
import JwtAuthenticationGuard from '../authentication/jwt-authentication.guard';
import { CreateApplicationDto } from './dto/create-application.dto';
import { ApplicationsService } from './applications.service';
import { Request } from 'express';
import { GetApplicationsByDurationDto } from './dto/get-applications-by-duration.dto';
import { Application } from './application.entity';

@Controller('applications')
export class ApplicationsController {
  private readonly logger = new Logger(ApplicationsController.name, true);

  constructor(private applicationsService: ApplicationsService) {}

  // 申請履歴取得(期間指定)
  @Get('/period')
  @UseGuards(JwtAuthenticationGuard)
  async getApplicationsByPeriod(
    @Req() request,
    @Query(ValidationPipe) durationDto: GetApplicationsByDurationDto,
  ): Promise<ApplicationDto[]> {
    this.logger.debug('getApplicationsByMonth');
    this.logger.debug('id=' + request.user.id);
    this.logger.debug(
      'cookies.Authentication=' + request.cookies.Authentication,
    );
    this.logger.debug('cookies.Refresh=' + request.cookies.Refresh);

    this.logger.debug(durationDto);

    const resultApplications = await this.applicationsService.getApplicationsByDuration(
      request.user.id,
      durationDto,
    );

    return ApplicationsController.createApplicationDtoList(resultApplications);
  }

  // 申請履歴取得(All)
  @Get()
  @UseGuards(JwtAuthenticationGuard)
  async getApplications(@Req() request): Promise<ApplicationDto[]> {
    this.logger.debug('getApplications');
    this.logger.debug('id=' + request.user.id);
    this.logger.debug(
      'cookies.Authentication=' + request.cookies.Authentication,
    );
    this.logger.debug('cookies.Refresh=' + request.cookies.Refresh);

    const resultApplications = await this.applicationsService.getApplications(
      request.user.id,
    );

    return ApplicationsController.createApplicationDtoList(resultApplications);
  }

  @Post()
  @UseGuards(JwtAuthenticationGuard)
  async createApplication(
    @Req() request: Request,
    @Body() createApplication: CreateApplicationDto,
  ) {
    this.logger.debug('createApplication');
    this.logger.debug(
      'cookies.Authentication=' + request.cookies.Authentication,
    );
    this.logger.debug('cookies.Refresh=' + request.cookies.Refresh);

    this.logger.debug(createApplication);
    // await new Promise((resolve) => setTimeout(resolve, 5000));
    await this.applicationsService.createApplication(createApplication);
    return createApplication;
  }

  @Delete(':workingDay/delete')
  @UseGuards(JwtAuthenticationGuard)
  async deleteByWorkingDay(
    @Req() request,
    @Param('workingDay') workingDay: string,
  ): Promise<ApplicationDto> {
    this.logger.debug('deleteByWorkingDay');
    this.logger.debug('id=' + request.user.id);
    this.logger.debug('workingDay=' + workingDay);
    this.logger.debug(
      'cookies.Authentication=' + request.cookies.Authentication,
    );
    this.logger.debug('cookies.Refresh=' + request.cookies.Refresh);

    const application = await this.applicationsService.deleteApplicationByWorkingDay(
      workingDay,
      request.user.id,
    );

    const applicationDto = ApplicationsController.createApplicationDto(
      application,
    );
    applicationDto.workingDay = workingDay;

    return applicationDto;
  }

  private static createApplicationDtoList(
    applications: Application[],
  ): ApplicationDto[] {
    const applicationDto = <ApplicationDto[]>[];
    applications.map(function (app) {
      const dto = ApplicationsController.createApplicationDto(app);
      applicationDto.push(dto);
    });

    return applicationDto;
  }

  private static createApplicationDto(app: Application): ApplicationDto {
    const dto = new ApplicationDto();
    if (app.workingDay !== undefined && app.workingDay !== null) {
      dto.workingDay = app.workingDay.toString();
    }
    dto.applicationType = app.applicationType;
    if (app.start !== undefined && app.start !== null) {
      dto.start = app.start.toISOString();
    }
    if (app.end !== undefined && app.end !== null) {
      dto.end = app.end.toISOString();
    }
    dto.overtimeReason = app.overtimeReason;
    dto.leaveTypeId = app.leaveTypeId;

    return dto;
  }
}
