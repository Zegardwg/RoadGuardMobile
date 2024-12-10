import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  final bool isLoggedIn;

  HomePage({this.isLoggedIn = false});

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;

  final List<Widget> _loggedOutPages = [
    HomeScreen(),
    Center(child: Text('Profile Page', style: TextStyle(fontSize: 18))),
    Center(child: Text('Settings Page', style: TextStyle(fontSize: 18))),
  ];

  final List<Widget> _loggedInPages = [
    HomeScreen(),
    Center(child: Text('Monitoring Page', style: TextStyle(fontSize: 18))),
    Center(child: Text('User Page', style: TextStyle(fontSize: 18))),
    Center(child: Text('Report Page', style: TextStyle(fontSize: 18))),
    Center(child: Text('Guide Page', style: TextStyle(fontSize: 18))),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    final pages = widget.isLoggedIn ? _loggedInPages : _loggedOutPages;
    final bottomNavItems = widget.isLoggedIn
        ? [
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
          ]
        : [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person),
              label: 'Profile',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.settings),
              label: 'Settings',
            ),
          ];

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.teal,
        elevation: 0,
        title: Text(
          'RoadGuard',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        actions: widget.isLoggedIn
            ? null
            : [
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
      body: pages[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        items: bottomNavItems,
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.teal,
        unselectedItemColor: Colors.grey,
        onTap: _onItemTapped,
      ),
    );
  }
}

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          // Bagian atas
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [Colors.teal, Colors.teal.shade700],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
            ),
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 40),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  'PENDETEKSI LUBANG JALAN',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 26,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 16),
                Text(
                  'Mempermudah pemantauan infrastruktur jalan secara real-time dan akurat.',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.white70,
                    fontSize: 16,
                  ),
                ),
                SizedBox(height: 32),
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
                        padding:
                            EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                      ),
                      child: Text('Open Camera'),
                    ),
                    SizedBox(width: 16),
                    ElevatedButton.icon(
                      onPressed: () {
                        // Logika untuk tombol download
                      },
                      icon: Icon(Icons.download),
                      label: Text('Download'),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.teal.shade700,
                        foregroundColor: Colors.white,
                        padding:
                            EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),

          // Fitur tambahan
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                _buildFeatureItem(
                  imagePath: 'web/assets/feature1.png',
                  title: 'Deteksi Bahaya',
                  description:
                      'AI mutakhir untuk deteksi lubang jalan secara otomatis.',
                ),
                SizedBox(height: 16),
                _buildFeatureItem(
                  imagePath: 'web/assets/feature2.png',
                  title: 'Mudah Diintegrasi',
                  description: 'Kemudahan ekspor data untuk aplikasi lain.',
                ),
                SizedBox(height: 16),
                _buildFeatureItem(
                  imagePath: 'web/assets/feature3.png',
                  title: 'Dasbor & Laporan',
                  description: 'Dasbor yang intuitif dan mudah digunakan.',
                ),
                SizedBox(height: 16),
                _buildFeatureItem(
                  imagePath: 'web/assets/feature4.png',
                  title: 'Produktivitas',
                  description: 'Pengelolaan sumber daya yang lebih baik.',
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildFeatureItem({
    required String imagePath,
    required String title,
    required String description,
  }) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 8,
            offset: Offset(0, 4),
          ),
        ],
      ),
      padding: const EdgeInsets.all(16),
      child: Row(
        children: [
          Image.asset(
            imagePath,
            height: 80,
            width: 80,
            fit: BoxFit.cover,
          ),
          SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.teal.shade800,
                  ),
                ),
                SizedBox(height: 8),
                Text(
                  description,
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.black87,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
