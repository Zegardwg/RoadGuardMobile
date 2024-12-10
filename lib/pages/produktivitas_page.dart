import 'package:flutter/material.dart';

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
