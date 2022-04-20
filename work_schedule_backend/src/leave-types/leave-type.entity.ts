import {
  BaseEntity,
  Column,
  CreateDateColumn,
  Entity,
  PrimaryGeneratedColumn,
  UpdateDateColumn,
} from 'typeorm';

@Entity()
export class LeaveType extends BaseEntity {
  @PrimaryGeneratedColumn()
  id: number;

  @Column({ length: 20, default: '' })
  leaveTypeName: string;

  @Column({ length: 255, default: '' })
  comment: string;

  @CreateDateColumn()
  createdAt: Date;

  @UpdateDateColumn()
  updatedAt: Date;
}
