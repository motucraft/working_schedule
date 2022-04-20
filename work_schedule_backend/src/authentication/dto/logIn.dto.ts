import { IsNotEmpty, IsString, MinLength } from 'class-validator';

export class LogInDto {
  @IsString()
  userId: string;

  @IsString()
  @IsNotEmpty()
  @MinLength(7)
  password: string;
}

export default LogInDto;
