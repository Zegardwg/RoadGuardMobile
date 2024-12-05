import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.teal,
        elevation: 0,
        actions: [
          TextButton(
            onPressed: () {
              Navigator.pushNamed(context, '/login');
            },
            child: Text(
              'Sign In',
              style: TextStyle(color: Colors.white),
            ),
          ),
          TextButton(
            onPressed: () {
              Navigator.pushNamed(context, '/register');
            },
            child: Text(
              'Sign Up',
              style: TextStyle(color: Colors.white),
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Bagian atas
            Container(
              color: Colors.teal,
              padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 40),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    'PENDETEKSI LUBANG JALAN',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 16),
                  Text(
                    'Aplikasi cerdas pendeteksi lubang jalan berbasis YOLO yang mempermudah pemantauan infrastruktur secara akurat dan real-time.',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                    ),
                  ),
                  SizedBox(height: 32),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ElevatedButton(
                        onPressed: () {
                          // Tambahkan logika untuk membuka kamera
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.white,
                          foregroundColor: Colors.teal,
                          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                        ),
                        child: Text('Open Camera'),
                      ),
                      SizedBox(width: 16),
                      ElevatedButton(
                        onPressed: () {
                          // Tambahkan logika untuk tombol download
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.teal.shade700,
                          foregroundColor: Colors.white,
                          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                        ),
                        child: Row(
                          children: [
                            Icon(Icons.download),
                            SizedBox(width: 8),
                            Text('Download'),
                          ],
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 40),
                  Text(
                    'Built with latest technology',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 14,
                    ),
                  ),
                  SizedBox(height: 16),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.build, color: Colors.white, size: 32),
                      SizedBox(width: 16),
                      Icon(Icons.auto_graph, color: Colors.white, size: 32),
                      SizedBox(width: 16),
                      Icon(Icons.brush, color: Colors.white, size: 32),
                      SizedBox(width: 16),
                      Icon(Icons.computer, color: Colors.white, size: 32),
                    ],
                  ),
                  SizedBox(height: 40),
                  Image.asset(
                    'web/assets/yolo.gif',
                    fit: BoxFit.cover,
                  ),
                ],
              ),
            ),

            // Bagian fitur tambahan
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
              child: Column(
                children: [
                  _buildFeatureItem(
                    imagePath: 'web/assets/feature1.png',
                    title: 'DETEKSI BAHAYA',
                    description:
                        'Kamera AI mutakhir dipasang di kendaraan Anda & Pengumpulan dan analisis data infrastruktur penting secara real-time.',
                  ),
                  SizedBox(height: 32),
                  _buildFeatureItem(
                    imagePath: 'web/assets/feature2.png',
                    title: 'MUDAH TERINTEGRASI',
                    description:
                        'Cara mudah untuk mengekspor data untuk digunakan dalam sistem dan aplikasi lain.',
                  ),
                  SizedBox(height: 32),
                  _buildFeatureItem(
                    imagePath: 'web/assets/feature3.png',
                    title: 'DASBOR & LAPORAN KUAT',
                    description:
                        'Akses ke data Anda dari mana saja, kapan saja. Antarmuka yang intuitif dan mudah digunakan dengan dasbor yang dapat disesuaikan.',
                  ),
                  SizedBox(height: 32),
                  _buildFeatureItem(
                    imagePath: 'web/assets/feature4.png',
                    title: 'PRODUKTIVITAS DAN KEPATUHAN',
                    description:
                        'Gunakan aplikasi pendamping untuk menyederhanakan penjadwalan dan penetapan tugas. Kelola tugas pemeliharaan jalan dengan memantau peta insiden dan cetakannya.',
                  ),
                ],
              ),
            ),

            // Bagian tambahan: Mudah Digunakan (ditambahkan di bawah fitur tambahan)
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Container(
                padding: EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(8),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.1),
                      blurRadius: 6,
                      offset: Offset(0, 2),
                    ),
                  ],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Mudah Digunakan',
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                        color: Colors.teal,
                      ),
                    ),
                    SizedBox(height: 8),
                    Text(
                      'RoadGuard merevolusi inspeksi jalan dan infrastruktur. '
                      'Ditengah oleh teknologi YOLO dan kamera AI mutakhir, aplikasi ini mengotomatiskan deteksi lubang jalan serta analisis data secara real-time, membuat pemantauan lebih mudah dan efektif.',
                      style: TextStyle(fontSize: 16, color: Colors.black),
                    ),
                    SizedBox(height: 16),
                    Text(
                      'Dengan RoadGuard, Anda dapat dengan cepat mendeteksi dan melaporkan masalah infrastruktur, memungkinkan tindakan preventif untuk memperbaiki kekurangan dan memastikan keselamatan jalan, sekaligus menekan biaya perbaikan dan pemeliharaan. RoadGuard juga membekali tim Anda dengan alat pengelolaan sumber daya yang lebih baik, memastikan kepatuhan terhadap standar dan regulasi yang berlaku. Optimalkan proses kerja dan tingkatkan efisiensi dengan solusi cerdas dari RoadGuard.',
                      style: TextStyle(fontSize: 16, color: Colors.black),
                    ),
                    SizedBox(height: 16),
                    Center(
                      child: Image.asset(
                        'web/assets/ipad.png',
                        height: 200,
                        fit: BoxFit.cover,
                      ),
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
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 8,
            offset: Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        children: [
          Image.asset(
            imagePath,
            height: 150,
            fit: BoxFit.contain,
          ),
          SizedBox(height: 16),
          Text(
            title,
            style: TextStyle(
              color: Colors.black,
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 8),
          Text(
            description,
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.black,
              fontSize: 14,
            ),
          ),
        ],
      ),
    );
  }
}
