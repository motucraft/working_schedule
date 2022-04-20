import {
  Body,
  ClassSerializerInterceptor,
  Controller,
  Get,
  HttpCode,
  Logger,
  Post,
  Req,
  UseGuards,
  UseInterceptors,
} from '@nestjs/common';
import { AuthenticationService } from './authentication.service';
import RegisterDto from './dto/register.dto';
import RequestWithUser from './requestWithUser.interface';
import { LocalAuthenticationGuard } from './localAuthentication.guard';
import JwtAuthenticationGuard from './jwt-authentication.guard';
import { UsersService } from '../users/users.service';
import JwtRefreshGuard from './jwt-refresh.guard';

@Controller('authentication')
@UseInterceptors(ClassSerializerInterceptor)
export class AuthenticationController {
  private readonly logger = new Logger(AuthenticationController.name, true);

  constructor(
    private readonly authenticationService: AuthenticationService,
    private readonly usersService: UsersService,
  ) {}

  @Post('register')
  async register(@Body() registrationData: RegisterDto) {
    this.logger.debug(registrationData);
    return this.authenticationService.register(registrationData);
  }

  @HttpCode(200)
  @UseGuards(LocalAuthenticationGuard)
  @Post('login')
  async logIn(@Req() request: RequestWithUser) {
    this.logger.debug('logIn');
    this.logger.debug('id=' + request.user.id);
    this.logger.debug(
      'cookies.Authentication=' + request.cookies.Authentication,
    );
    this.logger.debug('cookies.Refresh=' + request.cookies.Refresh);

    // TODO
    // await new Promise((resolve) => setTimeout(resolve, 3000));

    const { user } = request;
    const accessTokenCookie = this.authenticationService.getCookieWithJwtAccessToken(
      user.id,
    );
    const {
      cookie: refreshTokenCookie,
      token: refreshToken,
    } = this.authenticationService.getCookieWithJwtRefreshToken(user.id);

    await this.usersService.setCurrentRefreshToken(refreshToken, user.id);

    request.res.setHeader('Set-Cookie', [
      accessTokenCookie,
      refreshTokenCookie,
    ]);
    return user;
  }

  @UseGuards(JwtAuthenticationGuard)
  @Post('logout')
  @HttpCode(200)
  async logOut(@Req() request: RequestWithUser) {
    this.logger.debug('logOut');
    this.logger.debug('id=' + request.user.id);
    this.logger.debug('userId=' + request.user.userId);
    this.logger.debug(
      'cookies.Authentication=' + request.cookies.Authentication,
    );
    this.logger.debug('cookies.Refresh=' + request.cookies.Refresh);

    await this.usersService.removeRefreshToken(request.user.id);
    request.res.setHeader(
      'Set-Cookie',
      this.authenticationService.getCookiesForLogOut(),
    );
  }

  @UseGuards(JwtAuthenticationGuard)
  @Get()
  authenticate(@Req() request: RequestWithUser) {
    return request.user;
  }

  @UseGuards(JwtRefreshGuard)
  @Get('refresh')
  refresh(@Req() request: RequestWithUser) {
    this.logger.debug('refresh');
    this.logger.debug('id=' + request.user.id);
    this.logger.debug(
      'cookies.Authentication=' + request.cookies.Authentication,
    );
    this.logger.debug('cookies.Refresh=' + request.cookies.Refresh);

    const accessTokenCookie = this.authenticationService.getCookieWithJwtAccessToken(
      request.user.id,
    );

    request.res.setHeader('Set-Cookie', accessTokenCookie);
    return request.user;
  }
}
