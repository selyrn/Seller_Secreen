import 'package:flutter/material.dart';

void main() {
  runApp(EditProdukPage());
}

class EditProdukPage extends StatefulWidget {
  @override
  State<EditProdukPage> createState() => _EditProdukPageState();
}

class _EditProdukPageState extends State<EditProdukPage> {
  String? _selectedCategory;
  String? _selectedProvince;
  String? _selectedDistrict;
  String? _selectedSubDistrict;

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
          title: Text('Edit Produk'),
          toolbarHeight: 50,
          backgroundColor: Colors.white,
          leading: IconButton(
            icon: Icon(Icons.arrow_back_ios_new_rounded),
            onPressed: () {},
          ),
        ),
        body: buildEditProduct(),
      ),
    );
  }

  Widget buildEditProduct() {
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
            initialValue: 'Produk A', // Contoh nilai awal
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
            initialValue: '1000000', // Contoh nilai awal
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
            initialValue: '10', // Contoh nilai awal
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
            initialValue:
                'Deskripsi produk yang sudah ada', // Contoh deskripsi awal
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
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              ElevatedButton(
                onPressed: () {
                  // Fungsi untuk menyimpan produk
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color.fromARGB(255, 56, 83, 240),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(100),
                  ),
                ),
                child: Padding(
                  padding: EdgeInsets.symmetric(vertical: 15, horizontal: 20),
                  child: Text(
                    'Simpan',
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.white,
                      fontFamily: 'Poppins',
                    ),
                  ),
                ),
              ),
              ElevatedButton(
                onPressed: () {
                  // Fungsi untuk menghapus produk
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color.fromARGB(
                      255, 172, 32, 22), // Ubah warna tombol menjadi merah
                ),
                child: Padding(
                  padding: EdgeInsets.symmetric(vertical: 15, horizontal: 20),
                  child: Text(
                    'Hapus', // Ubah teks tombol menjadi "Hapus"
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.white,
                      fontFamily: 'Poppins',
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
