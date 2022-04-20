import { IsISO8601, IsString } from 'class-validator';

export class CreateApplicationDto {
  // 勤務日(または休暇日)
  @IsISO8601({ strict: true })
  workingDay: string;

  // 申請タイプ(1:勤務 2:休暇)
  @IsString()
  applicationType: string;

  // ユーザID
  @IsString()
  userId: string;

  // 勤務開始時刻
  @IsString()
  start: string;

  // 勤務終了時刻
  @IsString()
  end: string;

  // 時間外理由
  @IsString()
  overtimeReason: string;

  // 休暇区分ID
  @IsString()
  leaveTypeId: string;
}
