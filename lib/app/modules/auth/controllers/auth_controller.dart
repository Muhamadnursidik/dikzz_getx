import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:dikzz_getx/app/services/auth_service.dart';
import '../../../routes/app_pages.dart';

class AuthController extends GetxController {
  final AuthService api = AuthService();
  final box = GetStorage();

  var isLoading = false.obs;

  Future<void> login(String email, String password) async {
    try {
      isLoading.value = true;
      final res = await api.login(email, password);
      if (res.statusCode == 200) {
        final token = res.body['access_token'];
        box.write('token', token);
        Get.offAllNamed(Routes.HOME);
      } else {
        Get.snackbar("Error", res.body['message'] ?? "Login gagal");
      }
    } catch (e) {
      Get.snackbar("Error", "Terjadi kesalahan: $e");
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> register(String name, String email, String password) async {
    isLoading.value = true;
    final res = await api.register(name, email, password);
    isLoading.value = false;

    if (res.statusCode == 201) {
      Get.snackbar("Success", "Register berhasil");
      Get.offAllNamed(Routes.LOGIN);
    } else {
      Get.snackbar("Error", res.body.toString());
    }
  }

  Future<void> logout() async {
    try {
      isLoading(true);
      final token = box.read('token');
      if (token != null) {
        final response = await api.logout(token);
        if (response.statusCode == 200) {
          box.remove('token');
          Get.offAllNamed('/auth/login');
        } else {
          Get.snackbar('Error', response.statusText ?? 'Logout failed');
        }
      }
    } catch (e) {
      Get.snackbar('Exception', e.toString());
    } finally {
      isLoading(false);
    }
  }
}
