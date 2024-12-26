import 'package:flutter/material.dart';

class ReportPage extends StatefulWidget {
  const ReportPage({Key? key}) : super(key: key);

  @override
  _ReportPageState createState() => _ReportPageState();
}

class _ReportPageState extends State<ReportPage> {
  int _selectedIndex = 3; // Set the default index to the 'Report' page

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
        title: const Text('Laporan Deteksi'),
        backgroundColor: Colors.teal,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [Colors.teal, Colors.teal.shade700],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Text(
                      'Laporan Mingguans',
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    SizedBox(height: 8),
                    Text(
                      'Data terbaru tentang lubang jalan yang terdeteksi dan perbaikan.',
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.white70,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  _buildStatCard('Lubang Baru', '0', Colors.red),
                  _buildStatCard('Dalam Perbaikan', '0', Colors.orange),
                  _buildStatCard('Sudah Diperbaiki', '0', Colors.green),
                ],
              ),
              const SizedBox(height: 16),
              const Text(
                'Daftar Laporan',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.teal,
                ),
              ),
              const SizedBox(height: 8),
              ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: 5,
                itemBuilder: (context, index) {
                  return _buildReportItem(
                    title: 'Lubang Jalan ${index + 1}',
                    location: 'Lokasi: Jl. Raya ${index + 1}',
                    status: index % 2 == 0 ? 'Sudah Diperbaiki' : 'Dalam Perbaikan',
                    statusColor: index % 2 == 0 ? Colors.green : Colors.orange,
                    onTap: () {
                      // Navigasi ke detail laporan
                    },
                  );
                },
              ),
            ],
          ),
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

  Widget _buildReportItem({
    required String title,
    required String location,
    required String status,
    required Color statusColor,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Card(
        elevation: 5,
        margin: const EdgeInsets.symmetric(vertical: 8),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Row(
            children: [
              Icon(Icons.report, color: Colors.teal, size: 40),
              const SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.teal,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      location,
                      style: const TextStyle(
                        fontSize: 14,
                        color: Colors.black54,
                      ),
                    ),
                  ],
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    status,
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      color: statusColor,
                    ),
                  ),
                  const SizedBox(height: 8),
                  const Icon(Icons.chevron_right, color: Colors.teal),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
