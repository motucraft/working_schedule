import { IsISO8601, IsNotEmpty, IsString } from 'class-validator';

export class LeaveTypeDto {
  @IsNotEmpty()
  id: string;

  @IsNotEmpty()
  @IsString()
  leaveTypeName: string;

  @IsString()
  comment: string;
}
