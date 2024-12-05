import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        leading: TextButton.icon(
          onPressed: () {
            Navigator.pop(context); // Kembali ke halaman sebelumnya
          },
          icon: Icon(Icons.arrow_back, color: Colors.black),
          label: Text(
            'Return Home',
            style: TextStyle(color: Colors.black, fontSize: 12),
          ),
        ),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.pushNamed(context, '/register'); // Navigasi ke halaman register
            },
            child: Text(
              'Belum Bikin Akun? CREATE NOW',
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
              SizedBox(height: MediaQuery.of(context).size.height * 0.1), // Ruang atas proporsional
              Center(
                child: Column(
                  children: [
                    Text(
                      'BECOME AN EXCLUSIVE\nROAD GUARD',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 8),
                    Text(
                      'LOG IN TO CONTINUE',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.grey,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: MediaQuery.of(context).size.height * 0.05), // Ruang antara teks dan field
              _buildTextField(
                icon: Icons.email_outlined,
                hintText: 'example@email.com',
                isPassword: false,
              ),
              SizedBox(height: 16),
              _buildTextField(
                icon: Icons.lock_outline,
                hintText: '********',
                isPassword: true,
              ),
              SizedBox(height: MediaQuery.of(context).size.height * 0.05),
              ElevatedButton(
                onPressed: () {
                  // Tambahkan logika untuk login
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.teal,
                  foregroundColor: Colors.white,
                  minimumSize: Size(double.infinity, 50),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Proceed to my Account'),
                    Icon(Icons.arrow_forward),
                  ],
                ),
              ),
              SizedBox(height: MediaQuery.of(context).size.height * 0.05),
              Align(
                alignment: Alignment.center,
                child: TextButton.icon(
                  onPressed: () {
                    // Tambahkan aksi untuk bantuan
                  },
                  icon: Icon(
                    Icons.help_outline,
                    color: Colors.grey,
                  ),
                  label: Text(
                    'Need help?',
                    style: TextStyle(color: Colors.grey),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTextField({
    required IconData icon,
    required String hintText,
    required bool isPassword,
  }) {
    return TextField(
      obscureText: isPassword,
      decoration: InputDecoration(
        prefixIcon: Icon(icon, color: Colors.teal),
        hintText: hintText,
        hintStyle: TextStyle(color: Colors.grey),
        filled: true,
        fillColor: Colors.grey.shade200,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide.none,
        ),
        suffixIcon: isPassword
            ? IconButton(
                icon: Icon(Icons.visibility_outlined, color: Colors.grey),
                onPressed: () {
                  // Tambahkan aksi untuk toggle password visibility
                },
              )
            : null,
      ),
    );
  }
}
