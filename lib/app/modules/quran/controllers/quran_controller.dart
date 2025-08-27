import 'package:get/get.dart';
import 'package:dikzz_getx/app/data/models/quran.dart';
import 'package:dikzz_getx/app/services/quran_service.dart';

class QuranController extends GetxController {
  final QuranService _quranService = Get.put<QuranService>(QuranService());

  RxList<Quran> quranList = <Quran>[].obs;
  RxBool isLoading = true.obs;
  RxString errorMessage = ''.obs;

  @override
  void onInit() {
    super.onInit();
    fetchQuran();
  }

  void fetchQuran() async {
    try {
      isLoading(true);
      errorMessage('');

      final response = await _quranService.fetchQuran();

      if (response.statusCode == 200) {
        var data = response.body!
            .map<Quran>((json) => Quran.fromJson(json))
            .toList();
        quranList.assignAll(data);
      } else {
        errorMessage('Error: ${response.statusText}');
      }
    } catch (e) {
      errorMessage('Exception: $e');
    } finally {
      isLoading(false);
    }
  }
}
