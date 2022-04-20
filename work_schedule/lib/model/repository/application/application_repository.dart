import '../../model/application_model.dart';

abstract class ApplicationRepository {
  Future<List<ApplicationModel>> getApplications();

  Future<List<ApplicationModel>> getApplicationsByPeriod(
      String begin, String end);

  Future<ApplicationModel> postApplication(ApplicationModel applicationModel);

  Future<ApplicationModel> deleteApplication(DateTime workingDay);
}
