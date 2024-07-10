import 'package:flutter/material.dart';

class HistoryScreen extends StatelessWidget {
  final List<String> topics = [
    'Matematika Dasar',
    'Bahasa Inggris',
    'Fisika Modern',
    'Sejarah Dunia',
    'Biologi Molekuler'
  ]; // Contoh daftar topik yang sudah dipelajari

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('History Pembelajaran'),
        backgroundColor: Colors.blue, // Ubah warna background appbar
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
          itemCount: topics.length,
          itemBuilder: (context, index) {
            return Card(
              elevation: 5,
              margin: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15.0),
              ),
              child: ListTile(
                leading: Icon(Icons.history, color: Colors.blue),
                title: Text(
                  'Topik: ${topics[index]}',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.blue,
                  ),
                ),
                subtitle: Text(
                  'Detail pembelajaran terkait topik ini',
                  style: TextStyle(fontSize: 14),
                ),
                onTap: () {
                  // Tambahkan aksi jika ingin menavigasi ke halaman detail pembelajaran
                },
              ),
            );
          },
        ),
      ),
    );
  }
}
