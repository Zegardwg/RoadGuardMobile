import 'package:flutter/material.dart';

class FeaturePage extends StatelessWidget {
  const FeaturePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Detail Fitur'),
        backgroundColor: const Color(0xFF00C08B),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            _buildFeatureItem(
              imagePath: 'web/assets/feature1.png',
              title: 'DETEKSI BAHAYA',
              description: 'Kamera AI mutakhir dipasang di kendaraan Anda & '
                  'Pengumpulan dan analisis data infrastruktur penting secara real-time',
            ),
            const SizedBox(height: 32),
            _buildFeatureItem(
              imagePath: 'web/assets/feature2.png',
              title: 'MUDAH TERINTEGRASI',
              description: 'Cara mudah untuk mengekspor data untuk digunakan dalam sistem dan aplikasi lain',
            ),
            const SizedBox(height: 32),
            _buildFeatureItem(
              imagePath: 'web/assets/feature3.png',
              title: 'DASBOR & LAPORAN KUAT',
              description: 'Akses ke data Anda dari mana saja, kapan saja Antarmuka yang intuitif dan mudah digunakan dengan dasbor yang dapat disesuaikan',
            ),
            const SizedBox(height: 32),
            _buildFeatureItem(
              imagePath: 'web/assets/feature4.png',
              title: 'PRODUKTIVITAS DAN KEPATUHAN',
              description: 'Gunakan aplikasi pendamping untuk menyederhanakan penjadwalan dan penetapan tugas Kelola tugas pemeliharaan jalan dengan memantau peta insiden dan cetakannya',
            ),
            const SizedBox(height: 32),
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context); // Navigasi kembali ke halaman utama
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF00664B), // Hijau gelap
                foregroundColor: Colors.white,
                padding: const EdgeInsets.symmetric(
                  horizontal: 32,
                  vertical: 16,
                ),
              ),
              child: const Text('Kembali ke Halaman Utama'),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildFeatureItem({
    required String imagePath,
    required String title,
    required String description,
  }) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        children: [
          Image.asset(
            imagePath,
            height: 150,
            fit: BoxFit.contain,
          ),
          const SizedBox(height: 16),
          Text(
            title,
            style: const TextStyle(
              color: Colors.black,
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            description,
            textAlign: TextAlign.center,
            style: const TextStyle(
              color: Colors.black,
              fontSize: 14,
            ),
          ),
        ],
      ),
    );
  }
}