import 'package:flutter/material.dart';

class GuidePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Panduan Pengguna'),
        backgroundColor: Colors.teal,
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Panduan Aplikasi RoadGuard',
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 16),
            Text(
              '1. Pendaftaran dan Masuk',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            Text(
              'Masuk atau daftar untuk mengakses fitur aplikasi. Anda memerlukan akun untuk menggunakan layanan RoadGuard.',
            ),
            SizedBox(height: 16),
            Text(
              '2. Mulai Monitoring',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            Text(
              'Klik pada menu Monitoring untuk memulai pemantauan kondisi jalan secara real-time menggunakan kamera.',
            ),
            SizedBox(height: 16),
            Text(
              '3. Melihat Laporan',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            Text(
              'Buka menu Laporan untuk melihat daftar insiden yang telah dideteksi. Anda juga dapat mengunduh laporan dalam format PDF.',
            ),
            SizedBox(height: 16),
            Text(
              '4. Profil Pengguna',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            Text(
              'Edit profil Anda di menu Pengguna untuk memperbarui informasi atau keluar dari aplikasi.',
            ),
            SizedBox(height: 16),
            Center(
              child: ElevatedButton(
                onPressed: () {
                  // Logika kembali ke halaman utama
                  Navigator.pop(context);
                },
                child: Text('Kembali ke Beranda'),
                style: ElevatedButton.styleFrom(backgroundColor: Colors.teal),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
