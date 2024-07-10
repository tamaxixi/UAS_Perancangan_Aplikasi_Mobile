import 'package:flutter/material.dart';

class ProfilePage extends StatefulWidget {
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  TextEditingController _nameController = TextEditingController();
  
  TextEditingController _emailController = TextEditingController();
  TextEditingController _addressController = TextEditingController();
  TextEditingController _phoneNumberController = TextEditingController();
  TextEditingController _KelasController = TextEditingController();

  // Contoh data profil pengguna
  String _currentName = 'Azura Anggriana';
  String _currentEmail = 'azura@email.com';
  String _currentAddress = 'Medan';
  String _currentPhoneNumber = '1234567890';
  String _currentKelas = '10';

  @override
  void initState() {
    super.initState();
    // Inisialisasi controller dengan nilai awal
    _nameController.text = _currentName;
    _emailController.text = _currentEmail;
    _addressController.text = _currentAddress;
    _phoneNumberController.text = _currentPhoneNumber;
    _KelasController.text = _currentKelas;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Profil Pengguna'),
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.blueAccent, Colors.lightBlueAccent],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: CircleAvatar(
                  radius: 50,
                  backgroundImage: AssetImage('assets/images/profile.jpeg'), // Ganti dengan path foto profil jika ada
                ),
              ),
              SizedBox(height: 20),
              Card(
                elevation: 5,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15.0),
                ),
                margin: EdgeInsets.symmetric(vertical: 10),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      TextFormField(
                        controller: _nameController,
                        decoration: InputDecoration(labelText: 'Nama'),
                      ),
                      SizedBox(height: 10),
                      TextFormField(
                        controller: _emailController,
                        decoration: InputDecoration(labelText: 'Email'),
                      ),
                      SizedBox(height: 10),
                      TextFormField(
                        controller: _addressController,
                        decoration: InputDecoration(labelText: 'Alamat'),
                      ),
                      SizedBox(height: 10),
                      TextFormField(
                        controller: _phoneNumberController,
                        decoration: InputDecoration(labelText: 'Nomor Telepon'),
                      ),
                      SizedBox(height: 10),
                      TextFormField(
                        controller: _KelasController,
                        decoration: InputDecoration(labelText: 'Kelas'),
                      ),
                      SizedBox(height: 20),
                      Center(
                        child: ElevatedButton(
                          onPressed: () => _editProfile(context),
                          child: Text('Edit Profil'),
                          style: ElevatedButton.styleFrom(
                            padding: EdgeInsets.symmetric(horizontal: 30, vertical: 15),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15.0),
                            ),
                            backgroundColor: Colors.blueAccent,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _editProfile(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Edit Profil'),
          content: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                TextFormField(
                  controller: _nameController,
                  decoration: InputDecoration(labelText: 'Nama'),
                ),
                TextFormField(
                  controller: _emailController,
                  decoration: InputDecoration(labelText: 'Email'),
                ),
                TextFormField(
                  controller: _addressController,
                  decoration: InputDecoration(labelText: 'Alamat'),
                ),
                TextFormField(
                  controller: _phoneNumberController,
                  decoration: InputDecoration(labelText: 'Nomor Telepon'),
                ),
                TextFormField(
                  controller: _KelasController,
                  decoration: InputDecoration(labelText: 'Kelas'),
                ),
                SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {
                    _saveProfileChanges();
                    Navigator.of(context).pop();
                  },
                  child: Text('Simpan'),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blueAccent,
                  ),
                ),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('Batal'),
            ),
          ],
        );
      },
    );
  }

  void _saveProfileChanges() {
    setState(() {
      // Simpan perubahan profil ke dalam variabel yang menyimpan data profil aktual
      _currentName = _nameController.text;
      _currentEmail = _emailController.text;
      _currentAddress = _addressController.text;
      _currentPhoneNumber = _phoneNumberController.text;
      _currentKelas = _KelasController.text;
    });
  }

  @override
  void dispose() {
    // Pastikan untuk membuang controller ketika widget dihapus dari tree
    _nameController.dispose();
    _emailController.dispose();
    _addressController.dispose();
    _phoneNumberController.dispose();
    _KelasController.dispose();
    super.dispose();
  }
}
