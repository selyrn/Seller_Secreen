import 'package:flutter/material.dart';
import 'package:pin_code_text_field/pin_code_text_field.dart';
import 'package:timer_builder/timer_builder.dart';

void main() {
  runApp(OTPPage());
}

class OTPPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: OTPScreen(),
    );
  }
}

class OTPScreen extends StatefulWidget {
  @override
  _OTPScreenState createState() => _OTPScreenState();
}

class _OTPScreenState extends State<OTPScreen> {
  List<TextEditingController> controllers =
      List.generate(4, (index) => TextEditingController());
  List<FocusNode> focusNodes = List.generate(4, (index) => FocusNode());

  Duration expirationDuration = Duration(minutes: 1);

  @override
  void initState() {
    super.initState();
    for (int i = 0; i < 3; i++) {
      controllers[i].addListener(() {
        if (controllers[i].text.length == 1) {
          FocusScope.of(context).requestFocus(focusNodes[i + 1]);
        }
      });
    }
    controllers[3].addListener(() {
      if (controllers[3].text.length == 1) {
        // Terakhir, hilangkan fokus dari semua kotak input
        FocusScope.of(context).unfocus();
      }
    });
  }

  TextEditingController pinController = TextEditingController();
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
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Masukkan Kode Verifikasi',
                    style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Poppins',
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20),
              Text(
                'Kami hanya mengirimkan Anda kode verifikasi melalui WhatsApp',
                style: TextStyle(
                  fontSize: 18,
                  fontFamily: 'Poppins',
                  color: Color.fromARGB(255, 119, 116, 116),
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 20),
              PinCodeTextField(
                maxLength: 4,
                autofocus: true,
                keyboardType: TextInputType.number,
                hideCharacter: false, // Menampilkan karakter di dalam kotak
                highlight: true,
                highlightColor: Colors.blue,
                defaultBorderColor: Colors.black,
                hasTextBorderColor: Colors.green,
                wrapAlignment: WrapAlignment.spaceAround,
                pinBoxDecoration:
                    ProvidedPinBoxDecoration.underlinedPinBoxDecoration,
                pinTextStyle: TextStyle(fontSize: 20),
                pinBoxWidth: 50,
                pinBoxHeight: 50,
                onTextChanged: (text) {
                  // Fungsi yang dipanggil saat teks berubah
                },
                onDone: (text) {
                  // Fungsi yang dipanggil saat pengguna menekan tombol 'Selesai'
                },
              ),
              SizedBox(height: 30),
              ElevatedButton(
                onPressed: () {
                  // Tambahkan aksi untuk tombol Kirim Kode di sini
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color.fromARGB(255, 56, 83, 240),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(100),
                  ),
                ),
                child: Padding(
                  padding: EdgeInsets.symmetric(vertical: 15, horizontal: 90),
                  child: Text(
                    'Kirim Kode',
                    style: TextStyle(
                      fontSize: 16,
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 10),
              TimerBuilder.periodic(Duration(seconds: 1), builder: (context) {
                final Duration remainingTime = expirationDuration -
                    Duration(seconds: DateTime.now().second);
                if (remainingTime.inSeconds <= 0) {
                  return Text(
                    'Kode verifikasi telah kadaluwarsa',
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors
                          .red, // Menampilkan dalam warna merah untuk menonjolkan kesalahan
                    ),
                  );
                } else {
                  return Text(
                    'Kode verifikasi akan kadaluwarsa pada ${formatDuration(remainingTime)}',
                    style: TextStyle(
                      fontSize: 14,
                      fontFamily: 'Poppins',
                      color: Color.fromARGB(255, 119, 116, 116),
                    ),
                  );
                }
              }),
              SizedBox(height: 10),
              GestureDetector(
                onTap: () {
                  // Tambahkan aksi untuk mengirim ulang kode di sini
                },
                child: Text(
                  'Kirim ulang kode',
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.blue,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Poppins',
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

String formatDuration(Duration duration) {
  String twoDigits(int n) => n.toString().padLeft(2, "0");
  String twoDigitMinutes = twoDigits(duration.inMinutes.remainder(60));
  String twoDigitSeconds = twoDigits(duration.inSeconds.remainder(60));
  return "$twoDigitMinutes:$twoDigitSeconds";
}
