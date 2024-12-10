import 'package:flutter/material.dart';

class MonitoringPage extends StatefulWidget {
  const MonitoringPage({Key? key}) : super(key: key);

  @override
  _MonitoringPageState createState() => _MonitoringPageState();
}

class _MonitoringPageState extends State<MonitoringPage> {
  int _selectedIndex = 1; // Set to 1 because this is the Monitoring page

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
        title: const Text('Monitoring', style: TextStyle(fontWeight: FontWeight.bold)),
        elevation: 0,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          // Header dengan informasi summary
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
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                Text(
                  'Monitoring Jalan',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 8),
                Text(
                  'Pantau status dan aktivitas jalan secara real-time.',
                  style: TextStyle(
                    color: Colors.white70,
                    fontSize: 16,
                  ),
                ),
              ],
            ),
          ),

          const SizedBox(height: 16),

          // Monitoring Statistik
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Statistik Monitoring',
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
                    _buildStatCard('Lubang Aktif', '45', Colors.orange),
                    _buildStatCard('Perbaikan', '30', Colors.green),
                    _buildStatCard('Laporan Baru', '12', Colors.blue),
                  ],
                ),
              ],
            ),
          ),

          const SizedBox(height: 16),

          // Daftar Monitoring
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Aktivitas Terbaru',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.teal,
                    ),
                  ),
                  const SizedBox(height: 16),
                  Expanded(
                    child: ListView(
                      children: [
                        _buildActivityCard(
                          'Lubang terdeteksi di Jl. Mawar',
                          'Dilaporkan 2 jam lalu',
                          Icons.warning,
                          Colors.orange,
                        ),
                        const SizedBox(height: 12),
                        _buildActivityCard(
                          'Perbaikan selesai di Jl. Melati',
                          'Diselesaikan kemarin',
                          Icons.check_circle,
                          Colors.green,
                        ),
                        const SizedBox(height: 12),
                        _buildActivityCard(
                          'Laporan baru di Jl. Kenanga',
                          'Dilaporkan 1 jam lalu',
                          Icons.report,
                          Colors.blue,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
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

  Widget _buildActivityCard(String title, String subtitle, IconData icon, Color iconColor) {
    return Card(
      elevation: 5,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: ListTile(
        leading: CircleAvatar(
          backgroundColor: iconColor.withOpacity(0.2),
          child: Icon(icon, color: iconColor),
        ),
        title: Text(
          title,
          style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
        ),
        subtitle: Text(subtitle),
        trailing: const Icon(Icons.chevron_right, color: Colors.teal),
        onTap: () {
          // Logika navigasi ke detail
        },
      ),
    );
  }
}
