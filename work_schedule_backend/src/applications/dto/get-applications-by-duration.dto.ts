import { IsISO8601 } from 'class-validator';

export class GetApplicationsByDurationDto {
  @IsISO8601({ strict: true })
  begin: string;

  @IsISO8601({ strict: true })
  end: string;
}
