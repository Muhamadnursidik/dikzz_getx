import 'package:get/get.dart';

class QuranService extends GetConnect {
  void onInit() {
    httpClient.baseUrl = 'https://api.npoint.io/99c279bb173a6e28359c';
    super.onInit();
  }

  Future<Response<List<dynamic>>> fetchQuran() {
    return get('/data');
  }
}
