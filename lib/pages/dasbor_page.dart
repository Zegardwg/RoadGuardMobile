import 'package:flutter/material.dart';

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
