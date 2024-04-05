import 'package:flutter/material.dart';

void main() {
  runApp(NewPasswordPage());
}

class NewPasswordPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: NewPasswordScreen(),
    );
  }
}

class NewPasswordScreen extends StatefulWidget {
  @override
  _NewPasswordScreenState createState() => _NewPasswordScreenState();
}

class _NewPasswordScreenState extends State<NewPasswordScreen> {
  bool _obscureText = true;
  bool _confirmObscureText = true;

  void _toggleVisibility() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }

  void _toggleConfirmVisibility() {
    setState(() {
      _confirmObscureText = !_confirmObscureText;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios_new_rounded),
          onPressed: () {
            // Tambahkan aksi ketika tombol kembali ditekan di sini
          },
        ),
        // title: Text('Verifikasi OTP'),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(30.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text(
                    'Kata Sandi Baru',
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Poppins',
                    ),
                  ),
                ],
              ),
              SizedBox(height: 10),
              Text(
                'Masukkan kata sandi baru anda dengan kombinasi huruf & angka',
                style: TextStyle(
                  fontSize: 18,
                  fontFamily: 'Poppins',
                  color: Color.fromARGB(255, 119, 116, 116),
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 15),
              TextFormField(
                obscureText: _obscureText,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.lock),
                  suffixIcon: IconButton(
                    icon: _obscureText
                        ? Icon(Icons.visibility_off_outlined)
                        : Icon(Icons.visibility_outlined),
                    onPressed: _toggleVisibility,
                  ),
                  labelText: 'Kata Sandi Baru',
                ),
              ),
              SizedBox(height: 10),
              TextFormField(
                obscureText: _confirmObscureText,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.lock),
                  suffixIcon: IconButton(
                    icon: _confirmObscureText
                        ? Icon(Icons.visibility_off_outlined)
                        : Icon(Icons.visibility_outlined),
                    onPressed: _toggleConfirmVisibility,
                  ),
                  labelText: 'Konfirmasi Kata Sandi Baru',
                ),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  // Tambahkan aksi untuk tombol berikutnya di sini
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
                    'Simpan',
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Poppins',
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
