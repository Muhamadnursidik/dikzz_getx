import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:get/get.dart';

import '../controllers/form_pendaftaran_controller.dart';

class FormPendaftaranView extends GetView<FormPendaftaranController> {
  const FormPendaftaranView({super.key});
  @override
  Widget build(BuildContext context) {
    final FormPendaftaranController controller = Get.put(
      FormPendaftaranController(),
    );
    return Scaffold(
      appBar: AppBar(title: const Text('Form Pendaftaran'), centerTitle: true),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Column(
            children: [
              Obx(
                () => TextField(
                  onChanged: (value) {
                    controller.name.value = value;
                    controller.validateName(name: value);
                  },
                  decoration: InputDecoration(
                    labelText: 'Name',
                    errorText: controller.nameError.value.isNotEmpty
                        ? controller.nameError.value
                        : null,
                  ),
                ),
              ),
              SizedBox(height: 16.0),
              Obx(
                () => DropdownButtonFormField<String>(
                  value: controller.gender.value.isEmpty
                      ? null
                      : controller.gender.value,
                  hint: Text('Pilih Jenis Kelamin'),
                  items: ['laki-laki', 'perempuan']
                      .map(
                        (gender) => DropdownMenuItem(
                          value: gender,
                          child: Text(gender),
                        ),
                      )
                      .toList(),
                  onChanged: (value) {
                    controller.gender.value = value!;
                  },
                  decoration: InputDecoration(
                    labelText: 'jenis kelamin',
                    errorText: controller.genderError.value.isNotEmpty
                        ? controller.genderError.value
                        : null,
                  ),
                ),
              ),
              SizedBox(height: 16.0),
              Obx(
                () => ListTile(
                  title: Text(
                    controller.dateofBirth.value == null
                        ? 'pilih Tanggal lahir'
                        : DateFormat(
                            'dd-MM-yyyy',
                          ).format(controller.dateofBirth.value!),
                  ),
                  trailing: Icon(Icons.calendar_today_outlined),
                  onTap: () async {
                    final selectedDate = await showDatePicker(
                      context: context,
                      initialDate: DateTime.now(),
                      firstDate: DateTime(1990),
                      lastDate: DateTime.now(),
                    );
                    if (selectedDate != null) {
                      controller.dateofBirth.value = selectedDate;
                      controller.validatedateOfBirth(
                        tanggallahir: selectedDate,
                      );
                    }
                  },
                  subtitle: controller.dateofBirthError.value.isNotEmpty
                      ? Text(
                          controller.dateofBirthError.value,
                          style: TextStyle(color: Colors.red),
                        )
                      : null,
                ),
              ),
              SizedBox(height: 16.0),
              Obx(
                () => TextField(
                  onChanged: (value) {
                    controller.phone.value = value;
                    // controller.validatephone(phone: value);
                  },
                  keyboardType: TextInputType.phone,
                  decoration: InputDecoration(
                    labelText: 'Nomor Telepon',
                    errorText: controller.phoneError.value.isNotEmpty
                        ? controller.phoneError.value
                        : null,
                  ),
                ),
              ),
              SizedBox(height: 16.0),
              ElevatedButton(
                onPressed: () {
                  controller.submitForm();
                },
                child: Text('submit'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
