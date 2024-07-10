import 'package:flutter/material.dart';

class SubBabScreen extends StatelessWidget {
  final String matpel;

  SubBabScreen({required this.matpel});

  @override
  Widget build(BuildContext context) {
    // Simulasi daftar sub bab, bisa diganti dengan data sesuai kebutuhan
    List<String> subBabs = [
      'Sub Bab 1',
      'Sub Bab 2',
      'Sub Bab 3',
      'Sub Bab 4',
    ];

    return Scaffold(
      appBar: AppBar(
        title: Text('Materi Pembelajaran: $matpel'),
        backgroundColor: Colors.lightBlueAccent,
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.blueAccent, Colors.lightBlueAccent],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: ListView.builder(
          itemCount: subBabs.length,
          itemBuilder: (context, index) {
            return Card(
              elevation: 5,
              margin: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15.0),
              ),
              child: ListTile(
                leading: Icon(Icons.topic, color: Colors.blue),
                title: Text(
                  subBabs[index],
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.blue,
                  ),
                ),
                subtitle: Text(
                  'Deskripsi atau detail sub bab $matpel',
                  style: TextStyle(fontSize: 14),
                ),
                onTap: () {
                  // Tambahkan aksi jika ingin menavigasi ke halaman detail sub bab
                },
              ),
            );
          },
        ),
      ),
    );
  }
}
