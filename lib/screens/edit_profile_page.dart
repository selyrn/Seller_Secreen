import 'package:flutter/material.dart';
import 'package:seller_app/screens/profile_page.dart';

void main() {
  runApp(EditProfilePage());
}

class EditProfilePage extends StatefulWidget {
  @override
  State<EditProfilePage> createState() => _EditProfilePageState();
}

class _EditProfilePageState extends State<EditProfilePage> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text('Edit Profile'),
          backgroundColor: Colors.white,
          leading: IconButton(
            icon: Icon(Icons.arrow_back_ios_new_rounded),
            onPressed: () {},
          ),
        ),
        body: ProfileForm(),
      ),
    );
  }
}

class ProfileForm extends StatefulWidget {
  @override
  _ProfileFormState createState() => _ProfileFormState();
}

class _ProfileFormState extends State<ProfileForm> {
  String? _gender;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: EdgeInsets.all(25),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Stack(
                children: [
                  CircleAvatar(
                    radius: 50, // Updated radius to 50
                    backgroundImage: NetworkImage(
                      'https://picsum.photos/seed/picsum/200/300',
                    ),
                  ),
                  Positioned(
                    bottom: 0,
                    right: 0,
                    child: CircleAvatar(
                      backgroundColor: Color.fromARGB(255, 243, 232, 232),
                      radius: 20,
                      child: IconButton(
                        onPressed: () {},
                        icon: Icon(Icons.camera_alt),
                        color: Colors.black,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
          SizedBox(height: 15),
          ProfileField(label: 'Nama Toko', value: 'Nama Toko'),
          ProfileField(label: 'Username', value: 'Username'),
          ProfileField(label: 'Email', value: 'example@example.com'),
          ProfileField(label: 'No.Handphone', value: '+1234567890'),
          SizedBox(height: 10),
          Text(
            'Jenis Kelamin',
            style: TextStyle(
              fontFamily: 'Poppins',
              fontSize: 12,
              fontWeight: FontWeight.bold,
            ),
          ),
          Row(
            children: [
              Expanded(
                child: RadioListTile<String>(
                  title: Text(
                    'Laki-laki',
                    style: TextStyle(
                      fontFamily: 'Poppins',
                      fontSize: 11,
                    ),
                  ),
                  value: 'Laki-laki',
                  groupValue: _gender,
                  onChanged: (value) {
                    setState(() {
                      _gender = value;
                    });
                  },
                ),
              ),
              Expanded(
                child: RadioListTile<String>(
                  title: Text(
                    'Perempuan',
                    style: TextStyle(
                      fontFamily: 'Poppins',
                      fontSize: 11,
                    ),
                  ),
                  value: 'Perempuan',
                  groupValue: _gender,
                  onChanged: (value) {
                    setState(() {
                      _gender = value;
                    });
                  },
                ),
              ),
            ],
          ),
          SizedBox(height: 10),
          ProfileField(label: 'Tanggal Lahir', value: 'DD/MM/YY'),
          SizedBox(height: 20),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () {},
              child: Text(
                'Simpan',
                style: TextStyle(
                  fontFamily: 'Poppins',
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              style: ElevatedButton.styleFrom(
                padding: EdgeInsets.all(15),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(100),
                ),
                backgroundColor: Color.fromARGB(255, 56, 83, 240),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class ProfileField extends StatelessWidget {
  final String label;
  final String value;

  const ProfileField({
    required this.label,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                label,
                style: TextStyle(
                  fontFamily: 'Poppins',
                  fontSize: 12,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 0),
              TextFormField(
                initialValue: value,
                style: TextStyle(
                  fontFamily: 'Poppins',
                  fontSize: 12,
                  fontWeight: FontWeight.bold,
                ),
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 5),
            ],
          ),
        ),
      ],
    );
  }
}
