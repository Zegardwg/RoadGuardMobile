import 'package:flutter/material.dart';

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
