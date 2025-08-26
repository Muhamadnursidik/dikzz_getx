import 'package:dikzz_getx/app/modules/form_pendaftaran/views/result_screen_view.dart';
import 'package:get/get.dart';

class FormPendaftaranController extends GetxController {
  //variable reaktif untuk field form
  RxString name = ''.obs;
  RxString gender = ''.obs;
  Rxn<DateTime> dateofBirth = Rxn<DateTime>();
  RxString phone = ''.obs;

  //variable untuk error validasi
  RxString nameError = ''.obs;
  RxString genderError = ''.obs;
  RxString dateofBirthError = ''.obs;
  RxString phoneError = ''.obs;

  //Fungsi validasi Name
  void validateName({required String name}) {
    if (name.length < 3) {
      nameError.value = 'Nama minimal 3 karakter';
    } else {
      nameError.value = '';
    }
  }

  void validateGender({required String? jenisKelamin}) {
    if (jenisKelamin == null || jenisKelamin.isEmpty) {
      genderError.value = 'Pilih jenis kelamin';
    } else {
      genderError.value = '';
    }
  }

  void validatedateOfBirth({required DateTime? tanggallahir}) {
    if (tanggallahir == null) {
      dateofBirthError.value = 'Pilih Tanggal Lahir';
    } else {
      final now = DateTime.now();
      final age = now.year - tanggallahir.year;
      if (age < 2) {
        dateofBirthError.value = 'Umur minimal 2 tahun';
      } else {
        dateofBirthError.value = '';
      }
    }
  }

  void validatePhone({required String phone}) {
    if (!GetUtils.isPhoneNumber(phone)) {
      phoneError.value = 'Nomor Tidak Valid';
    } else {
      phoneError.value = '';
    }
  }

  void submitForm() {
    validateName(name: name.value);
    validateGender(jenisKelamin: gender.value);
    validatedateOfBirth(tanggallahir: dateofBirth.value);
    validatePhone(phone: phone.value);

    if (nameError.value.isEmpty &&
        genderError.value.isEmpty &&
        dateofBirthError.value.isEmpty &&
        phoneError.value.isEmpty) {
      Get.to(
        () => ResultScreenView(
          name: name.value,
          gender: gender.value,
          dateofBirth: dateofBirth.value!,
          phone: phone.value,
        ),
      );
    } else {}
  }

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }
}
