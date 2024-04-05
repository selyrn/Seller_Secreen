import 'package:flutter/material.dart';

void main() {
  runApp(RegisterPage());
}

class RegisterPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SignUpScreen(),
    );
  }
}

class SignUpScreen extends StatefulWidget {
  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  bool _obscureText = true;

  void _toggleVisibility() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(30.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Sign Up',
                    style: TextStyle(
                      fontSize: 35,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Poppins',
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20),
              Text(
                'Daftar sekarang dan dapatkan akses penuh ke layanan kami',
                style: TextStyle(
                  fontSize: 18,
                  fontFamily: 'Poppins',
                  color: Color.fromARGB(255, 119, 116, 116),
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 20),
              TextFormField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.call),
                  labelText: 'No. Handphone',
                ),
              ),
              SizedBox(height: 15),
              TextFormField(
                obscureText: _obscureText,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.lock_outline),
                  suffixIcon: IconButton(
                    icon: _obscureText
                        ? Icon(Icons.visibility_off_outlined)
                        : Icon(Icons.visibility),
                    onPressed: _toggleVisibility,
                  ),
                  labelText: 'Kata Sandi',
                ),
              ),
              SizedBox(height: 10),
              TextFormField(
                obscureText: _obscureText,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.lock_outline),
                  suffixIcon: IconButton(
                    icon: _obscureText
                        ? Icon(Icons.visibility_off_outlined)
                        : Icon(Icons.visibility),
                    onPressed: _toggleVisibility,
                  ),
                  labelText: 'Konfirmasi Kata Sandi',
                ),
              ),
              SizedBox(height: 10),
              ElevatedButton(
                onPressed: () {
                  // Tambahkan aksi untuk tombol Sign Up di sini
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color.fromARGB(255, 56, 83, 240),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(100),
                  ),
                ),
                child: Padding(
                  padding: EdgeInsets.symmetric(vertical: 15, horizontal: 95),
                  child: Text(
                    'Sign Up',
                    style: TextStyle(
                      fontSize: 18,
                      fontFamily: 'Poppins',
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Sudah punya akun? ',
                    style: TextStyle(
                      fontSize: 18,
                      fontFamily: 'Poppins',
                      color: Color.fromARGB(255, 119, 116, 116),
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      // Tambahkan aksi untuk tombol Sign In di sini
                    },
                    child: Text(
                      'Sign In',
                      style: TextStyle(
                        color: Colors.black,
                        decoration: TextDecoration.underline,
                        fontSize: 18,
                        fontFamily: 'Poppins',
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
