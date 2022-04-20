import { BaseEntity, Column, Entity, PrimaryColumn } from 'typeorm';

@Entity()
export class Application extends BaseEntity {
  @PrimaryColumn({ type: 'date' })
  workingDay: Date;

  @PrimaryColumn({ length: 20 })
  userId: string;

  @Column({ length: 1 })
  applicationType: string;

  @Column('datetime', { default: null })
  start: Date | null = null;

  @Column('datetime', { default: null })
  end: Date | null = null;

  @Column({ default: '' })
  overtimeReason: string;

  @Column({ length: 1, default: '' })
  leaveTypeId: string;
}
