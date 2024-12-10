import 'package:flutter/material.dart';

class GuidePage extends StatefulWidget {
  final bool isLoggedIn;

  const GuidePage({Key? key, this.isLoggedIn = false}) : super(key: key);

  @override
  _GuidePageState createState() => _GuidePageState();
}

class _GuidePageState extends State<GuidePage> {
  int _selectedIndex = 4; // Asumsikan Guide adalah tab ke-4

  void _onItemTapped(int index) {
    if (index == _selectedIndex) return; // Jika sudah di tab yang sama, tidak perlu navigasi ulang

    setState(() {
      _selectedIndex = index;
    });

    switch (index) {
      case 0:
        Navigator.pushReplacementNamed(context, '/');
        break;
      case 1:
        Navigator.pushReplacementNamed(context, '/monitoring');
        break;
      case 2:
        Navigator.pushReplacementNamed(context, '/user');
        break;
      case 3:
        Navigator.pushReplacementNamed(context, '/report');
        break;
      case 4:
        Navigator.pushReplacementNamed(context, '/guide');
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Panduan Penggunaan'),
        backgroundColor: Colors.teal,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Header
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [Colors.teal, Colors.teal.shade700],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
                borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(30),
                  bottomRight: Radius.circular(30),
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: const [
                  Icon(Icons.help_outline, size: 100, color: Colors.white),
                  SizedBox(height: 16),
                  Text(
                    'Panduan Penggunaan',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: 8),
                  Text(
                    'Langkah-langkah untuk menggunakan aplikasi dengan mudah.',
                    style: TextStyle(color: Colors.white70, fontSize: 16),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
            const SizedBox(height: 16),

            // Langkah-Langkah
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Langkah-Langkah',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.teal,
                    ),
                  ),
                  const SizedBox(height: 16),
                  _buildStepCard(
                    step: '1',
                    title: 'Mulai Deteksi',
                    description:
                        'Tekan tombol "Mulai Deteksi" di halaman utama untuk memulai proses deteksi lubang jalan.',
                  ),
                  const SizedBox(height: 16),
                  _buildStepCard(
                    step: '2',
                    title: 'Ambil Foto',
                    description:
                        'Arahkan kamera ke jalan dan ambil foto untuk mengidentifikasi lubang.',
                  ),
                  const SizedBox(height: 16),
                  _buildStepCard(
                    step: '3',
                    title: 'Hasil Analisis',
                    description:
                        'Lihat hasil analisis AI pada gambar untuk mengetahui lokasi dan tingkat bahaya lubang.',
                  ),
                  const SizedBox(height: 16),
                  _buildStepCard(
                    step: '4',
                    title: 'Simpan atau Bagikan',
                    description:
                        'Simpan hasil deteksi atau bagikan ke platform lain untuk tindak lanjut.',
                  ),
                ],
              ),
            ),

            const SizedBox(height: 16),

            // Tips Tambahan
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Tips Tambahan',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.teal,
                    ),
                  ),
                  const SizedBox(height: 16),
                  _buildTipCard(
                    title: 'Gunakan Kamera yang Stabil',
                    description:
                        'Pastikan kamera tidak goyang untuk hasil deteksi yang lebih akurat.',
                  ),
                  const SizedBox(height: 16),
                  _buildTipCard(
                    title: 'Pencahayaan yang Baik',
                    description:
                        'Pastikan kondisi jalan cukup terang untuk deteksi optimal.',
                  ),
                  const SizedBox(height: 16),
                  _buildTipCard(
                    title: 'Perbarui Aplikasi',
                    description:
                        'Selalu gunakan versi terbaru untuk performa terbaik.',
                  ),
                ],
              ),
            ),

            const SizedBox(height: 16),

            // CTA Button
            Padding(
              padding: const EdgeInsets.all(16),
              child: ElevatedButton(
                onPressed: () {
                  // Logika untuk kembali ke halaman utama
                  Navigator.pushReplacementNamed(context, '/');
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.teal,
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),
                child: const Text(
                  'Kembali ke Beranda',
                  style: TextStyle(fontSize: 18, color: Colors.white),
                ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.monitor),
            label: 'Monitoring',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.people),
            label: 'User',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.report),
            label: 'Report',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.help),
            label: 'Guide',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.teal,
        unselectedItemColor: Colors.grey,
        onTap: _onItemTapped,
        type: BottomNavigationBarType.fixed, // Untuk menampilkan semua label
      ),
    );
  }

  Widget _buildStepCard({
    required String step,
    required String title,
    required String description,
  }) {
    return Card(
      elevation: 5,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Row(
          children: [
            CircleAvatar(
              backgroundColor: Colors.teal.shade100,
              child: Text(
                step,
                style: const TextStyle(
                  color: Colors.teal,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.teal,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    description,
                    style: const TextStyle(
                      fontSize: 14,
                      color: Colors.black54,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTipCard({
    required String title,
    required String description,
  }) {
    return Card(
      elevation: 5,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Row(
          children: [
            const Icon(Icons.lightbulb, color: Colors.teal, size: 28),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.teal,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    description,
                    style: const TextStyle(
                      fontSize: 14,
                      color: Colors.black54,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
