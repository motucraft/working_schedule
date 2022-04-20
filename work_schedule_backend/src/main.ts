import { NestFactory } from '@nestjs/core';
import { AppModule } from './app.module';
import { ConfigService } from '@nestjs/config';
import { Logger } from '@nestjs/common';
import * as cookieParser from 'cookie-parser';

async function bootstrap() {
  const logger = new Logger(bootstrap.name, true);
  const app = await NestFactory.create(AppModule);
  app.use(cookieParser());

  // CORSを有効化する
  app.enableCors({
    origin: app.get(ConfigService).get('ORIGIN'),
    credentials: true,
  });

  const port = app.get(ConfigService).get('PORT');
  await app.listen(port);
  logger.log(`Application listening on port ${port}`);
}

bootstrap();
