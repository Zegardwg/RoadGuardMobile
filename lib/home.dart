import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  final bool isLoggedIn;

  const HomePage({Key? key, this.isLoggedIn = false}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
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
        backgroundColor: Colors.teal,
        title: const Text(
          'RoadGuard',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      body: const HomeScreen(),
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
      ),
    );
  }
}
class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Header dengan gradien dan shadow
            Stack(
              children: [
                Container(
                  height: 250,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [Colors.teal, Colors.teal.shade700],
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                    ),
                    borderRadius: const BorderRadius.only(
                      bottomLeft: Radius.circular(30),
                      bottomRight: Radius.circular(30),
                    ),
                  ),
                ),
                Positioned.fill(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        'PENDETEKSI LUBANG JALAN',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 26,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 16),
                      const Padding(
                        padding: EdgeInsets.symmetric(horizontal: 32),
                        child: Text(
                          'Mempermudah pemantauan infrastruktur jalan secara real-time dan akurat.',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Colors.white70,
                            fontSize: 16,
                          ),
                        ),
                      ),
                      const SizedBox(height: 32),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          ElevatedButton(
                            onPressed: () {
                              // Logika untuk membuka kamera
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.white,
                              foregroundColor: Colors.teal,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20),
                              ),
                              elevation: 5,
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 24, vertical: 12),
                            ),
                            child: const Text('Open Camera'),
                          ),
                          const SizedBox(width: 16),
                          ElevatedButton.icon(
                            onPressed: () {
                              // Logika untuk tombol download
                            },
                            icon: const Icon(Icons.download),
                            label: const Text('Download'),
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.teal.shade800,
                              foregroundColor: Colors.white,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20),
                              ),
                              elevation: 5,
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 20, vertical: 12),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),

            // Fitur tambahan
            const SizedBox(height: 16),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                children: [
                  _buildFeatureItem(
                    context: context,
                    imagePath: 'web/assets/feature1.png',
                    title: 'Deteksi Bahaya',
                    description:
                        'AI mutakhir untuk deteksi lubang jalan secara otomatis.',
                    page: const DeteksiBahayaPage(),
                  ),
                  const SizedBox(height: 16),
                  _buildFeatureItem(
                    context: context,
                    imagePath: 'web/assets/feature2.png',
                    title: 'Mudah Diintegrasi',
                    description: 'Kemudahan ekspor data untuk aplikasi lain.',
                    page: const IntegrasiPage(),
                  ),
                  const SizedBox(height: 16),
                  _buildFeatureItem(
                    context: context,
                    imagePath: 'web/assets/feature3.png',
                    title: 'Dasbor & Laporan',
                    description: 'Dasbor yang intuitif dan mudah digunakan.',
                    page: const DasborPage(),
                  ),
                  const SizedBox(height: 16),
                  _buildFeatureItem(
                    context: context,
                    imagePath: 'web/assets/feature4.png',
                    title: 'Produktivitas',
                    description: 'Pengelolaan sumber daya yang lebih baik.',
                    page: const ProduktivitasPage(),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildFeatureItem({
    required BuildContext context,
    required String imagePath,
    required String title,
    required String description,
    required Widget page,
  }) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => page),
        );
      },
      child: Card(
        elevation: 8,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
        shadowColor: Colors.teal.withOpacity(0.3),
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Row(
            children: [
              Container(
                height: 80,
                width: 80,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  image: DecorationImage(
                    image: AssetImage(imagePath),
                    fit: BoxFit.cover,
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
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),
              ),
              const Icon(Icons.chevron_right, color: Colors.teal),
            ],
          ),
        ),
      ),
    );
  }
}


// Halaman Deteksi Bahaya
class DeteksiBahayaPage extends StatelessWidget {
  const DeteksiBahayaPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Deteksi Bahaya'),
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
                  Icon(Icons.warning_amber_rounded, size: 100, color: Colors.white),
                  SizedBox(height: 16),
                  Text(
                    'AI untuk Deteksi Bahaya',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: 8),
                  Text(
                    'Monitor dan identifikasi lubang jalan secara otomatis.',
                    style: TextStyle(color: Colors.white70, fontSize: 16),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
            const SizedBox(height: 16),

            // Fitur Utama
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Fitur Utama',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.teal,
                    ),
                  ),
                  const SizedBox(height: 16),
                  _buildFeatureCard(
                    title: 'Pengenalan Lubang Jalan',
                    description:
                        'AI canggih yang dapat mengenali lubang jalan secara akurat. Dapat membantu perbaikan lebih cepat.',
                    icon: Icons.search,
                  ),
                  const SizedBox(height: 16),
                  _buildFeatureCard(
                    title: 'Peta Lokasi Bahaya',
                    description:
                        'Melacak lokasi bahaya dan memberikan panduan navigasi untuk menghindari rute buruk.',
                    icon: Icons.map,
                  ),
                  const SizedBox(height: 16),
                  _buildFeatureCard(
                    title: 'Notifikasi Real-time',
                    description:
                        'Peringatan instan melalui notifikasi saat ada jalan yang rusak terdeteksi.',
                    icon: Icons.notifications,
                  ),
                ],
              ),
            ),

            const SizedBox(height: 16),

            // Statistik
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Statistik Deteksi',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.teal,
                    ),
                  ),
                  const SizedBox(height: 16),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      _buildStatCard('Lubang Terdeteksi', '120', Colors.orange),
                      _buildStatCard('Perbaikan Selesai', '85', Colors.green),
                      _buildStatCard('Pengguna Aktif', '1.5K', Colors.blue),
                    ],
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
                  // Logika untuk mulai deteksi
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.teal,
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),
                child: const Text(
                  'Mulai Deteksi',
                  style: TextStyle(fontSize: 18, color: Colors.white),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildFeatureCard({
    required String title,
    required String description,
    required IconData icon,
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
              child: Icon(icon, color: Colors.teal, size: 28),
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

  Widget _buildStatCard(String title, String value, Color color) {
    return Expanded(
      child: Card(
        elevation: 5,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              Text(
                value,
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: color,
                ),
              ),
              const SizedBox(height: 8),
              Text(
                title,
                style: const TextStyle(fontSize: 14, color: Colors.black54),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// Halaman Mudah Diintegrasi

class IntegrasiPage extends StatelessWidget {
  const IntegrasiPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Integrasi Mudah'),
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
                  Icon(Icons.integration_instructions, size: 100, color: Colors.white),
                  SizedBox(height: 16),
                  Text(
                    'Integrasi dengan Teknologi Modern',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: 8),
                  Text(
                    'Kompatibel dengan framework dan bahasa pemrograman modern.',
                    style: TextStyle(color: Colors.white70, fontSize: 16),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
            const SizedBox(height: 16),

            // Teknologi Pendukung
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Teknologi Pendukung',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.teal,
                    ),
                  ),
                  const SizedBox(height: 16),
                  _buildTechCard(
                    icon: Icons.code,
                    title: 'React',
                    description: 'Framework modern untuk membangun antarmuka pengguna yang interaktif.',
                  ),
                  const SizedBox(height: 16),
                  _buildTechCard(
                    icon: Icons.storage,
                    title: 'Node.js',
                    description: 'Platform JavaScript untuk pengembangan backend yang cepat dan skalabel.',
                  ),
                  const SizedBox(height: 16),
                  _buildTechCard(
                    icon: Icons.style,
                    title: 'Tailwind CSS',
                    description: 'Framework utility-first CSS untuk styling yang fleksibel dan cepat.',
                  ),
                  const SizedBox(height: 16),
                  _buildTechCard(
                    icon: Icons.analytics,
                    title: 'Python',
                    description: 'Bahasa pemrograman serbaguna untuk analisis data, AI, dan automasi.',
                  ),
                ],
              ),
            ),

            const SizedBox(height: 16),

            // Keunggulan
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Keunggulan Integrasi',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.teal,
                    ),
                  ),
                  const SizedBox(height: 16),
                  _buildFeatureItem(
                    title: 'Dokumentasi Lengkap',
                    description: 'Dokumentasi yang mudah diikuti untuk mempermudah implementasi.',
                  ),
                  const SizedBox(height: 16),
                  _buildFeatureItem(
                    title: 'API Fleksibel',
                    description: 'Mendukung berbagai kebutuhan pengembangan dengan API RESTful.',
                  ),
                  const SizedBox(height: 16),
                  _buildFeatureItem(
                    title: 'Kompatibilitas Tinggi',
                    description: 'Dapat digunakan dengan berbagai platform dan bahasa pemrograman.',
                  ),
                ],
              ),
            ),

            const SizedBox(height: 16),

            // Call to Action
            Padding(
              padding: const EdgeInsets.all(16),
              child: ElevatedButton(
                onPressed: () {
                  // Logika untuk integrasi
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.teal,
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),
                child: const Text(
                  'Pelajari Lebih Lanjut',
                  style: TextStyle(fontSize: 18, color: Colors.white),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTechCard({
    required IconData icon,
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
              child: Icon(icon, color: Colors.teal, size: 28),
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

  Widget _buildFeatureItem({required String title, required String description}) {
    return Card(
      elevation: 5,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: ListTile(
        leading: CircleAvatar(
          backgroundColor: Colors.teal.shade100,
          child: const Icon(Icons.check, color: Colors.teal),
        ),
        title: Text(
          title,
          style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
        subtitle: Text(description),
      ),
    );
  }
}

// Halaman Dasbor & Laporan
class DasborPage extends StatelessWidget {
  const DasborPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Dasbor & Laporan'),
      ),
      body: const Center(
        child: Text('Informasi lengkap tentang Dasbor & Laporan.'),
      ),
    );
  }
}

// Halaman Produktivitas
class ProduktivitasPage extends StatelessWidget {
  const ProduktivitasPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Produktivitas'),
      ),
      body: const Center(
        child: Text('Informasi lengkap tentang Produktivitas.'),
      ),
    );
  }
}
