import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tengemate/data/api/api_client.dart';
import 'package:tengemate/util/app_constants.dart';

class SurveyRepo extends GetxService {
  final SharedPreferences sharedPreferences;
  SurveyRepo({required this.sharedPreferences});

  Future<Response?> getSurveyList({required ApiClient apiClient}) async {
    try {
      return await apiClient.getData(AppConstants.getAllSurveysUrl);
    } catch (e) {
      null;
    }
    return null;
  }
}
