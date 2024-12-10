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
      ),
      body: const Center(
        child: Text('Informasi lengkap tentang Deteksi Bahaya.'),
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
        title: const Text('Mudah Diintegrasi'),
      ),
      body: const Center(
        child: Text('Informasi lengkap tentang Mudah Diintegrasi.'),
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
