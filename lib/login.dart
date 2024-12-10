import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'home.dart';

class LoginPage extends StatelessWidget {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  Future<void> _handleLogin(BuildContext context) async {
    // Simulasi proses login (ganti dengan autentikasi yang sebenarnya)
    String email = _emailController.text;
    String password = _passwordController.text;

    if (email == 'user@example.com' && password == 'password123') {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      await prefs.setBool('isLoggedIn', true);

      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => HomePage(isLoggedIn: true)),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Invalid email or password')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.pushNamed(context, '/register');
            },
            child: Text(
              'Belum punya akun? Daftar',
              style: TextStyle(color: Colors.teal, fontSize: 12),
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: MediaQuery.of(context).size.height * 0.1),
              Text(
                'Welcome Back!',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 16),
              Text(
                'Log in to continue',
                style: TextStyle(fontSize: 16, color: Colors.grey),
              ),
              SizedBox(height: 32),
              _buildTextField(
                controller: _emailController,
                icon: Icons.email_outlined,
                hintText: 'Email',
                isPassword: false,
              ),
              SizedBox(height: 16),
              _buildTextField(
                controller: _passwordController,
                icon: Icons.lock_outline,
                hintText: 'Password',
                isPassword: true,
              ),
              SizedBox(height: 32),
              ElevatedButton(
                onPressed: () => _handleLogin(context),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.teal,
                  minimumSize: Size(double.infinity, 50),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                child: Text('Log In'),
              ),
              SizedBox(height: 16),
              TextButton(
                onPressed: () {
                  // Tambahkan aksi untuk Forgot Password
                },
                child: Text('Forgot Password?', style: TextStyle(color: Colors.grey)),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTextField({
    required TextEditingController controller,
    required IconData icon,
    required String hintText,
    required bool isPassword,
  }) {
    return TextField(
      controller: controller,
      obscureText: isPassword,
      decoration: InputDecoration(
        prefixIcon: Icon(icon, color: Colors.teal),
        hintText: hintText,
        filled: true,
        fillColor: Colors.grey.shade200,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide.none,
        ),
      ),
    );
  }
}
