import { Controller, Get, Logger, Req, UseGuards } from '@nestjs/common';
import { LeaveTypesService } from './leave-types.service';
import JwtAuthenticationGuard from '../authentication/jwt-authentication.guard';
import { LeaveTypeDto } from './dto/leave-type.dto';

@Controller('leave-types')
export class LeaveTypesController {
  private readonly logger = new Logger(LeaveTypesController.name, true);

  constructor(private leaveTypesService: LeaveTypesService) {}

  @Get()
  @UseGuards(JwtAuthenticationGuard)
  async getLeaveTypes(@Req() request): Promise<LeaveTypeDto[]> {
    this.logger.debug('getLeaveTypes');
    this.logger.debug('id=' + request.user.id);
    this.logger.debug(
      'cookies.Authentication=' + request.cookies.Authentication,
    );
    this.logger.debug('cookies.Refresh=' + request.cookies.Refresh);

    const resultLeaveTypes = await this.leaveTypesService.find();

    const leaveTypes = <LeaveTypeDto[]>[];
    resultLeaveTypes.map(function (leaveType) {
      const leaveTypeDto = new LeaveTypeDto();
      leaveTypeDto.id = leaveType.id.toString();
      leaveTypeDto.leaveTypeName = leaveType.leaveTypeName;
      leaveTypeDto.comment = leaveType.comment;
      leaveTypes.push(leaveTypeDto);
      console.log(leaveTypeDto);
    });

    return leaveTypes;
  }
}
