import 'package:flutter/material.dart';

class UserPage extends StatefulWidget {
  const UserPage({Key? key}) : super(key: key);

  @override
  _UserPageState createState() => _UserPageState();
}

class _UserPageState extends State<UserPage> {
  int _selectedIndex = 2; // Set default to 'User'

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
        title: const Text('Profil Pengguna'),
        backgroundColor: Colors.teal,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Header Profil
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [Colors.teal, Colors.teal.shade700],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
              ),
              child: Column(
                children: [
                  CircleAvatar(
                    radius: 50,
                    backgroundImage: AssetImage('web/assets/python.png'),
                  ),
                  const SizedBox(height: 16),
                  const Text(
                    'Nama Pengguna',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(height: 8),
                  const Text(
                    'email@domain.com',
                    style: TextStyle(color: Colors.white70, fontSize: 16),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 16),

            // Informasi Akun
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Informasi Akun',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.teal,
                    ),
                  ),
                  const SizedBox(height: 16),
                  _buildAccountInfoItem(
                    icon: Icons.person,
                    title: 'Nama Lengkap',
                    value: 'Nama Pengguna',
                  ),
                  const Divider(),
                  _buildAccountInfoItem(
                    icon: Icons.email,
                    title: 'Email',
                    value: 'email@domain.com',
                  ),
                  const Divider(),
                  _buildAccountInfoItem(
                    icon: Icons.phone,
                    title: 'Nomor Telepon',
                    value: '+62 812 3456 7890',
                  ),
                ],
              ),
            ),
            const SizedBox(height: 16),

            // Pengaturan
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Pengaturan',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.teal,
                    ),
                  ),
                  const SizedBox(height: 16),
                  _buildSettingsOption(
                    context: context,
                    icon: Icons.lock,
                    title: 'Ubah Kata Sandi',
                    onTap: () {
                      // Navigasi ke halaman ubah kata sandi
                    },
                  ),
                  const Divider(),
                  _buildSettingsOption(
                    context: context,
                    icon: Icons.notifications,
                    title: 'Pengaturan Notifikasi',
                    onTap: () {
                      // Navigasi ke halaman pengaturan notifikasi
                    },
                  ),
                  const Divider(),
                  _buildSettingsOption(
                    context: context,
                    icon: Icons.help,
                    title: 'Bantuan',
                    onTap: () {
                      // Navigasi ke halaman bantuan
                    },
                  ),
                ],
              ),
            ),
            const SizedBox(height: 16),

            // Tombol Keluar
            Padding(
              padding: const EdgeInsets.all(16),
              child: ElevatedButton(
                onPressed: () {
                  // Logika untuk keluar
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.red,
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),
                child: const Text(
                  'Keluar Akun',
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
      ),
    );
  }

  Widget _buildAccountInfoItem({
    required IconData icon,
    required String title,
    required String value,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        children: [
          Icon(icon, color: Colors.teal, size: 28),
          const SizedBox(width: 16),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.black54,
                ),
              ),
              const SizedBox(height: 4),
              Text(
                value,
                style: const TextStyle(fontSize: 14, color: Colors.black87),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildSettingsOption({
    required BuildContext context,
    required IconData icon,
    required String title,
    required VoidCallback onTap,
  }) {
    return ListTile(
      onTap: onTap,
      leading: Icon(icon, color: Colors.teal),
      title: Text(
        title,
        style: const TextStyle(fontSize: 16, color: Colors.black87),
      ),
      trailing: const Icon(Icons.chevron_right, color: Colors.teal),
    );
  }
}
