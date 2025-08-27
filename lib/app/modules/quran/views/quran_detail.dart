import 'package:dikzz_getx/app/data/models/quran.dart';
import 'package:flutter/material.dart';

class QuranDetailView extends StatelessWidget {
  final Quran surat;

  const QuranDetailView({super.key, required this.surat});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(surat.nama ?? "Detail Surat")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            Center(
              child: Text(
                surat.asma ?? "",
                style: const TextStyle(
                  fontSize: 40,
                  fontFamily: 'Amiri',
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const SizedBox(height: 16),
            Text(
              surat.nama ?? "",
              style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 8),
            Text(
              "Arti: ${surat.arti ?? '-'}",
              style: const TextStyle(fontSize: 16),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 16),
            Text(
              "Jumlah ayat: ${surat.ayat}",
              style: const TextStyle(fontSize: 16),
            ),
            Text(
              "Golongan: ${surat.type == SurahType.MEKAH ? 'Makkiyah' : 'Madaniyah'}",
              style: const TextStyle(fontSize: 16),
            ),
            Text(
              "Urutan turunnya: ${surat.urut}",
              style: const TextStyle(fontSize: 16),
            ),
            Text("Ruku: ${surat.rukuk}", style: const TextStyle(fontSize: 16)),
            const SizedBox(height: 16),
            Text(
              "Keterangan:",
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
            ),
            const SizedBox(height: 8),
            Text(surat.keterangan ?? "-", style: const TextStyle(fontSize: 16)),
          ],
        ),
      ),
    );
  }
}
