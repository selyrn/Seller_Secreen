import 'package:flutter/material.dart';

void main() {
  runApp(ProfilePage());
}

class ProfilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text(' '),
        ),
        body: ProfileBody(),
      ),
    );
  }
}

class ProfileBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Stack(
            alignment: Alignment.topCenter,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 20.0),
                child: CircleAvatar(
                  radius: 52.5,
                  backgroundImage:
                      NetworkImage('https://picsum.photos/seed/picsum/200/300'),
                ),
              ),
            ],
          ),
          SizedBox(height: 0.5),
          Text(
            'Nama Toko',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              fontFamily: 'Poppins',
              color: Colors.black,
            ),
          ),
          SizedBox(height: 5),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              GestureDetector(
                onTap: () {
                  // Implementasi untuk menampilkan profil
                },
                child: Text(
                  'Lihat dan Edit Profile ',
                  style: TextStyle(
                    color: Colors.blue,
                    //decoration: TextDecoration.underline,
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 20),
          Container(
            //color: Color.fromARGB(255, 221, 201, 201),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                ProfileDetail(label: 'Username', value: '@tokokita'),
                ProfileDetail(label: 'Email', value: 'tokokita@example.com'),
                ProfileDetail(label: 'No HP', value: '+1234567890'),
              ],
            ),
          )
        ],
      ),
    );
  }
}

class ProfileDetail extends StatelessWidget {
  final String label;
  final String value;

  const ProfileDetail({required this.label, required this.value});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 50),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(
                  '$label',
                  textAlign: TextAlign.justify,
                  style: TextStyle(fontSize: 12, fontFamily: 'Poppins'),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  value,
                  textAlign: TextAlign.start,
                  style: TextStyle(fontSize: 12, fontFamily: 'Poppins'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
