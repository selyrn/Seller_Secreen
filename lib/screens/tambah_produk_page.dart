import 'package:flutter/material.dart';

void main() {
  runApp(TambahProdukPage());
}

class TambahProdukPage extends StatefulWidget {
  @override
  State<TambahProdukPage> createState() => _TambahProdukPageState();
}

class _TambahProdukPageState extends State<TambahProdukPage> {
  String? _selectedCategory;
  String? _selectedProvince;
  String? _selectedDistrict;
  String? _selectedSubDistrict; // Variable untuk menyimpan kecamatan

  List<String> _categories = ['Fashion', 'Elektronik', 'Otomotif', 'Lainnya'];
  List<String> _provinces = [
    'Jawa Barat',
    'Jawa Tengah',
    'Jawa Timur',
    'Lainnya'
  ];
  List<String> _districts = ['Bandung', 'Surabaya', 'Semarang', 'Lainnya'];
  List<String> _subDistricts = [
    'Kecamatan 1',
    'Kecamatan 2',
    'Kecamatan 3',
    'Lainnya'
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text('Tambah Produk'),
          backgroundColor: Colors.white,
          leading: IconButton(
            icon: Icon(Icons.arrow_back_ios_new_rounded),
            onPressed: () {},
          ),
        ),
        body: buildAddProduct(),
      ),
    );
  }

  Widget buildAddProduct() {
    return SingleChildScrollView(
      padding: EdgeInsets.all(30),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 20),
          Text(
            'Nama Produk',
            style: TextStyle(
              fontSize: 16,
            ),
          ),
          TextFormField(
            decoration: InputDecoration(
              hintText: 'Masukkan nama produk',
              border: OutlineInputBorder(),
            ),
          ),
          SizedBox(height: 10),
          Text(
            'Harga',
            style: TextStyle(
              fontSize: 16,
            ),
          ),
          TextFormField(
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              hintText: 'Masukkan harga produk',
            ),
          ),
          SizedBox(height: 10),
          Text(
            'Qty',
            style: TextStyle(
              fontSize: 16,
            ),
          ),
          TextFormField(
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              hintText: 'Masukkan jumlah produk',
            ),
          ),
          SizedBox(height: 10),
          Text(
            'Kategori',
            style: TextStyle(
              fontSize: 16,
            ),
          ),
          DropdownButtonFormField<String>(
            value: _selectedCategory,
            onChanged: (newValue) {
              setState(() {
                _selectedCategory = newValue;
              });
            },
            decoration: InputDecoration(
              border: OutlineInputBorder(),
            ),
            items: _categories.map((category) {
              return DropdownMenuItem<String>(
                value: category,
                child: Text(category),
              );
            }).toList(),
          ),
          SizedBox(height: 10),
          Text(
            'Provinsi',
            style: TextStyle(
              fontSize: 16,
            ),
          ),
          DropdownButtonFormField<String>(
            value: _selectedProvince,
            onChanged: (newValue) {
              setState(() {
                _selectedProvince = newValue;
              });
            },
            decoration: InputDecoration(
              border: OutlineInputBorder(),
            ),
            items: _provinces.map((province) {
              return DropdownMenuItem<String>(
                value: province,
                child: Text(province),
              );
            }).toList(),
          ),
          SizedBox(height: 10),
          Text(
            'Kabupaten/Kota',
            style: TextStyle(
              fontSize: 16,
            ),
          ),
          DropdownButtonFormField<String>(
            value: _selectedDistrict,
            onChanged: (newValue) {
              setState(() {
                _selectedDistrict = newValue;
              });
            },
            decoration: InputDecoration(
              border: OutlineInputBorder(),
            ),
            items: _districts.map((district) {
              return DropdownMenuItem<String>(
                value: district,
                child: Text(district),
              );
            }).toList(),
          ),
          SizedBox(height: 10),
          Text(
            'Kecamatan',
            style: TextStyle(
              fontSize: 16,
            ),
          ),
          DropdownButtonFormField<String>(
            value: _selectedSubDistrict,
            onChanged: (newValue) {
              setState(() {
                _selectedSubDistrict = newValue;
              });
            },
            decoration: InputDecoration(
              border: OutlineInputBorder(),
            ),
            items: _subDistricts.map((subDistrict) {
              return DropdownMenuItem<String>(
                value: subDistrict,
                child: Text(subDistrict),
              );
            }).toList(),
          ),
          SizedBox(height: 10),
          Text(
            'Deskripsi Produk',
            style: TextStyle(
              fontSize: 16,
            ),
          ),
          TextFormField(
            maxLines: 5,
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              hintText: 'Masukkan deskripsi produk',
            ),
          ),
          SizedBox(height: 10),
          Text(
            'Upload Produk',
            style: TextStyle(
              fontSize: 16,
            ),
          ),
          SizedBox(height: 10),
          Row(
            children: [
              Expanded(
                child: Container(
                  height: 100,
                  color: Colors.grey[300],
                  child: Center(
                    child: Icon(Icons.camera_alt),
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 10),
          Text(
            'Foto Produk (1-9 gambar)',
            style: TextStyle(
              fontSize: 16,
            ),
          ),
          SizedBox(height: 10),
          Row(
            children: [
              Expanded(
                child: Container(
                  height: 100,
                  color: Colors.grey[300],
                  child: Center(
                    child: Icon(Icons.add),
                  ),
                ),
              ),
              SizedBox(width: 10),
              Expanded(
                child: Container(
                  height: 100,
                  color: Colors.grey[300],
                  child: Center(
                    child: Icon(Icons.add),
                  ),
                ),
              ),
              SizedBox(width: 10),
              Expanded(
                child: Container(
                  height: 100,
                  color: Colors.grey[300],
                  child: Center(
                    child: Icon(Icons.add),
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 20),
          Align(
            alignment: Alignment.center,
            child: OutlinedButton(
              onPressed: () {
                // Fungsi untuk mengirim produk
              },
              style: OutlinedButton.styleFrom(
                backgroundColor: Color.fromARGB(255, 56, 83, 240),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(100),
                ),
              ),
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 15, horizontal: 110),
                child: Text(
                  'Kirim',
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
