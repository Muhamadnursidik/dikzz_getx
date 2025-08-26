import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class ResultScreenView extends GetView {
  const ResultScreenView({
    super.key,
    required this.name,
    required this.gender,
    required this.dateofBirth,
    required this.phone,
  });

  final String name;
  final String gender;
  final DateTime dateofBirth;
  final String phone;

  int getAge(DateTime birthDate) {
    DateTime today = DateTime.now();
    int age = today.year - birthDate.year;

    if (today.month < birthDate.month ||
        (today.month == birthDate.month && today.day < birthDate.day)) {
      age--;
    }

    return age;
  }

  @override
  Widget build(BuildContext context) {
    String formattedDate = DateFormat("dd MMMM yyyy").format(dateofBirth);
    int age = getAge(dateofBirth);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Hasil Data'),
        centerTitle: true,
        elevation: 2,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            const SizedBox(height: 20),
            CircleAvatar(
              radius: 50,
              backgroundColor: Colors.blue.shade200,
              child: Text(
                name[0].toUpperCase(),
                style: const TextStyle(
                  fontSize: 40,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const SizedBox(height: 20),
            Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
              ),
              elevation: 4,
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  children: [
                    ListTile(
                      leading: const Icon(Icons.person, color: Colors.blue),
                      title: const Text("Nama"),
                      subtitle: Text(name),
                    ),
                    const Divider(),
                    ListTile(
                      leading: const Icon(Icons.wc, color: Colors.pink),
                      title: const Text("Jenis Kelamin"),
                      subtitle: Text(gender),
                    ),
                    const Divider(),
                    ListTile(
                      leading: const Icon(Icons.cake, color: Colors.orange),
                      title: const Text("Tanggal Lahir"),
                      subtitle: Text(formattedDate),
                      trailing: Text(
                        "$age th",
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.deepOrange,
                        ),
                      ),
                    ),
                    const Divider(),
                    ListTile(
                      leading: const Icon(Icons.phone, color: Colors.green),
                      title: const Text("Nomor Telepon"),
                      subtitle: Text(phone),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
