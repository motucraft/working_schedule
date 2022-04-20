import { IsISO8601, IsString } from 'class-validator';

export class ApplicationDto {
  // 勤務日(または休暇日)
  @IsISO8601({ strict: true })
  workingDay: string;

  // 申請タイプ(1:勤務 2:休暇)
  @IsString()
  applicationType: string;

  // 勤務開始時刻
  @IsISO8601({ strict: true })
  start: string;

  // 勤務終了時刻
  @IsISO8601({ strict: true })
  end: string;

  // 時間外理由
  @IsString()
  overtimeReason: string;

  // 休暇区分ID
  @IsString()
  leaveTypeId: string;
}
