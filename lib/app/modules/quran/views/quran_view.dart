import 'package:dikzz_getx/app/data/models/quran.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:dikzz_getx/app/modules/quran/controllers/quran_controller.dart';
import 'package:dikzz_getx/app/modules/quran/views/quran_detail.dart';

class QuranView extends StatelessWidget {
  final QuranController controller = Get.put(QuranController());

  QuranView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Al-Qur'an")),
      body: Obx(() {
        if (controller.isLoading.value) {
          return const Center(child: CircularProgressIndicator());
        }

        if (controller.errorMessage.isNotEmpty) {
          return Center(child: Text(controller.errorMessage.value));
        }

        if (controller.quranList.isEmpty) {
          return const Center(child: Text("Data kosong"));
        }

        return ListView.separated(
          itemCount: controller.quranList.length,
          separatorBuilder: (_, __) => const Divider(height: 1),
          itemBuilder: (context, index) {
            final surat = controller.quranList[index];
            return InkWell(
              onTap: () => Get.to(() => QuranDetailView(surat: surat)),
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  vertical: 12,
                  horizontal: 16,
                ),
                child: Row(
                  children: [
                    // Nomor surat
                    Container(
                      width: 36,
                      height: 36,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(color: Colors.grey.shade400),
                      ),
                      child: Center(
                        child: Text(
                          surat.nomor ?? "?",
                          style: const TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                    const SizedBox(width: 12),

                    // Info surat (latin & arti)
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            surat.nama ?? "",
                            style: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 4),
                          Text(
                            "${surat.arti} • ${surat.ayat} ayat • "
                            "${surat.type == SurahType.MEKAH ? 'Makkiyah' : 'Madaniyah'}",
                            style: TextStyle(
                              fontSize: 13,
                              color: Colors.grey.shade600,
                            ),
                          ),
                        ],
                      ),
                    ),

                    // Nama arab (kanan)
                    Text(
                      surat.asma ?? "",
                      style: const TextStyle(
                        fontSize: 22,
                        fontFamily: 'Amiri', // pake font arab kalo ada
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        );
      }),
    );
  }
}
