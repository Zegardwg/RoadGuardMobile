import 'package:flutter/material.dart';

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
