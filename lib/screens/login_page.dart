import 'package:flutter/material.dart';

void main() {
  runApp(LoginPage());
}

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: LoginScreen(),
    );
  }
}

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
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
              Text(
                'Sign In',
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontSize: 35,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Poppins',
                    letterSpacing: -0.3000000119),
              ),
              SizedBox(height: 15),
              Text(
                'Masukkan No Handphone',
                style: TextStyle(
                  fontSize: 18,
                  fontFamily: 'Poppins',
                  color: Color.fromARGB(255, 119, 116, 116),
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 1),
              Text(
                'dan Kata Sandi Anda',
                style: TextStyle(
                  fontSize: 18,
                  fontFamily: 'Poppins',
                  color: Color.fromARGB(255, 119, 116, 116),
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 20),
              TextFormField(
                style: TextStyle(
                  fontFamily: 'Poppins',
                ),
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.call),
                  labelText: 'No Handphone',
                ),
              ),
              SizedBox(height: 15),
              TextFormField(
                obscureText: _obscureText,
                style: TextStyle(
                  fontFamily: 'Poppins',
                ),
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.lock_outline_rounded),
                  suffixIcon: IconButton(
                    icon: _obscureText
                        ? Icon(Icons.visibility_off_outlined)
                        : Icon(Icons.visibility_outlined),
                    onPressed: _toggleVisibility,
                  ),
                  labelText: 'Kata Sandi',
                ),
              ),
              SizedBox(height: 1),
              Align(
                alignment: Alignment.centerRight,
                child: TextButton(
                  onPressed: () {
                    // Tambahkan aksi untuk lupa kata sandi di sini
                  },
                  child: Text(
                    'Lupa Kata Sandi?',
                    style: TextStyle(
                      fontFamily: 'Poppins',
                      color: Colors.blue,
                      fontSize: 14,
                      //decoration: TextDecoration.underline,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 10),
              ElevatedButton(
                onPressed: () {
                  // Tambahkan aksi untuk tombol Sign In di sini
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color.fromARGB(255, 56, 83, 240),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(100),
                  ),
                ),
                child: Padding(
                  padding: EdgeInsets.symmetric(vertical: 15, horizontal: 100),
                  child: Text(
                    'Sign In',
                    style: TextStyle(
                      fontSize: 18,
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.bold,
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
                    'Belum punya akun? ',
                    style: TextStyle(
                      fontFamily: 'Poppins',
                      fontSize: 18,
                      color: Color.fromARGB(255, 119, 116, 116),
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      // Tambahkan aksi untuk tombol Sign Up di sini
                    },
                    child: Text(
                      'Sign Up',
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
