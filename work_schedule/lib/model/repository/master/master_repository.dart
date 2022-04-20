import '../../../model/model/master/leave_type_model.dart';

abstract class MasterRepository {
  Future<List<LeaveTypeModel>> getLeaveTypes();
}
