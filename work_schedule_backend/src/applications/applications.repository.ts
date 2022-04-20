import { EntityRepository, getConnection, Repository } from 'typeorm';
import { Application } from './application.entity';
import { InternalServerErrorException, Logger } from '@nestjs/common';
import { CreateApplicationDto } from './dto/create-application.dto';
import { parseISO } from 'date-fns';
import { GetApplicationsByDurationDto } from './dto/get-applications-by-duration.dto';

@EntityRepository(Application)
export class ApplicationsRepository extends Repository<Application> {
  private readonly logger = new Logger(ApplicationsRepository.name, true);

  async findByUserIdAndDuration(
    userId: string,
    durationDto: GetApplicationsByDurationDto,
  ): Promise<Application[]> {
    const { begin, end } = durationDto;
    try {
      return await this.createQueryBuilder('application')
        .where('application.userId = :userId')
        .andWhere('application.workingDay BETWEEN :begin AND :end', {
          begin,
          end,
        })
        .setParameter('userId', userId)
        .getMany();
    } catch (e) {
      throw new InternalServerErrorException(e);
    }
  }

  async findByUserId(userId: string): Promise<Application[]> {
    try {
      return await this.createQueryBuilder('application')
        .where('application.userId = :userId')
        .setParameter('userId', userId)
        .getMany();
    } catch (e) {
      throw new InternalServerErrorException(e);
    }
  }

  async createApplication(
    createApplicationDto: CreateApplicationDto,
  ): Promise<Application> {
    this.logger.debug('createApplication');

    const {
      workingDay,
      applicationType,
      userId,
      start,
      end,
      overtimeReason,
      leaveTypeId,
    } = createApplicationDto;
    this.logger.debug(workingDay);
    this.logger.debug(parseISO(workingDay));
    this.logger.debug(applicationType);
    this.logger.debug(userId);

    const application = new Application();
    application.workingDay = parseISO(workingDay);
    application.applicationType = applicationType;
    application.userId = userId;
    application.start = parseISO(start);
    application.end = parseISO(end);
    application.overtimeReason = overtimeReason;
    application.leaveTypeId = leaveTypeId;

    try {
      await this.createQueryBuilder()
        .insert()
        .into(Application)
        .values(application)
        .orUpdate({
          conflict_target: ['workingDay', 'userId'],
          overwrite: [
            'workingDay',
            'userId',
            'applicationType',
            'start',
            'end',
            'overtimeReason',
            'leaveTypeId',
          ],
        })
        .execute();
    } catch (e) {
      this.logger.error(
        `Failed to create an application. Data: ${createApplicationDto}`,
        e.stack,
      );
      throw new InternalServerErrorException(e);
    }

    return application;
  }

  async deleteApplicationByWorkingDay(
    workingDay: string,
    userId: string,
  ): Promise<Application> {
    this.logger.debug('deleteApplicationByWorkingDay');
    const queryRunner = getConnection().createQueryRunner();
    await queryRunner.connect();
    await queryRunner.startTransaction();
    try {
      // 削除対処を取得(更新用の悲観ロックをかける)
      const application: Application = await queryRunner.manager
        .getRepository(Application)
        .createQueryBuilder('application')
        .useTransaction(true)
        .setLock('pessimistic_write')
        .where('workingDay = :workingDay')
        .andWhere('userId = :userId')
        .setParameters({ workingDay, userId })
        .getOne();

      if (application === undefined) {
        this.logger.debug('Delete target not found.');
        // ロックを開放するためにROLLBACK
        await queryRunner.rollbackTransaction();
        return;
      }

      // TODO
      // await new Promise((resolve) => setTimeout(resolve, 60000));

      // DELETE
      await queryRunner.manager.getRepository(Application).remove(application);

      // COMMIT
      await queryRunner.commitTransaction();

      this.logger.debug('application=' + JSON.stringify(application));

      return application;
    } catch (e) {
      this.logger.debug(e);
      // ROLLBACK
      await queryRunner.rollbackTransaction();
      throw new InternalServerErrorException(e);
    } finally {
      await queryRunner.release();
    }
  }
}
