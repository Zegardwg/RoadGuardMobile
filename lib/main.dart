import 'package:flutter/material.dart';
import 'home.dart';
import 'login.dart';
import 'register.dart';
import 'monitoring.dart';
import 'user.dart';
import 'report.dart';
import 'guide.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'RoadGuard - Pendeteksi Lubang Jalan',
      theme: ThemeData(
        primarySwatch: Colors.teal,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => HomePage(),
        '/login': (context) => LoginPage(),
        '/register': (context) => RegisterPage(),
        '/monitoring': (context) => MonitoringPage(),
        '/user': (context) => UserPage(),
        '/report': (context) => ReportPage(),
        '/guide': (context) => GuidePage(),
      },
    );
  }
}

