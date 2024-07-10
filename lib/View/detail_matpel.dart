import 'package:flutter/material.dart';
import 'package:uts_proyek/View/SubBabScreen.dart';
import '../models/matpel.dart';
import 'quiz_screen.dart';

class DetailMatpelScreen extends StatelessWidget {
  final Matpel matpel;

  DetailMatpelScreen({required this.matpel});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(matpel.namaMataPelajaran ?? ''),
      ),
      backgroundColor: Colors.lightBlueAccent,
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildDetailCard(
              leadingIcon: Icons.book,
              title: 'ID',
              subtitle: matpel.id.toString(),
            ),
            _buildDetailCard(
              leadingIcon: Icons.person,
              title: 'Guru',
              subtitle: matpel.guru ?? '',
            ),
            _buildDetailCard(
              leadingIcon: Icons.class_,
              title: 'Kelas',
              subtitle: matpel.kelas ?? '',
            ),
            _buildDetailCard(
              leadingIcon: Icons.timer,
              title: 'Jumlah Jam',
              subtitle: matpel.jumlahJam.toString(),
            ),
            _buildDetailCard(
              leadingIcon: Icons.description,
              title: 'Deskripsi',
              subtitle: matpel.deskripsi ?? '',
            ),
            _buildDetailCard(
              leadingIcon: Icons.school,
              title: 'Kurikulum',
              subtitle: matpel.kurikulum ?? '',
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ElevatedButton(
                  onPressed: () {
                    // Aksi saat tombol "Mulai Kuis" diklik
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => QuizScreen(matpel: matpel.namaMataPelajaran ?? '')),
                    );
                  },
                  child: Text(
                    'Mulai Quis',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 1.0,
                    ),
                  ),
                  style: ElevatedButton.styleFrom(
                    padding: EdgeInsets.symmetric(horizontal: 30, vertical: 15),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15.0),
                    ),
                  ),
                ),
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => SubBabScreen(matpel: matpel.namaMataPelajaran ?? '')),
                    );
                    // Aksi saat tombol "Mengajak Belajar" diklik
                    // Tambahkan logika sesuai kebutuhan
                  },
                  child: Text(
                    'Mulai Belajar',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 1.0,
                    ),
                  ),
                  style: ElevatedButton.styleFrom(
                    padding: EdgeInsets.symmetric(horizontal: 30, vertical: 15),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15.0),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildDetailCard({required IconData leadingIcon, required String title, required String subtitle}) {
    return Card(
      color: Color.fromARGB(255, 252, 254, 255),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15.0),
      ),
      elevation: 5,
      margin: EdgeInsets.symmetric(vertical: 10),
      child: ListTile(
        contentPadding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        leading: Icon(
          leadingIcon,
          size: 32,
          color: Colors.blue,
        ),
        title: Text(
          title,
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: Colors.blue,
          ),
        ),
        subtitle: Text(
          subtitle,
          style: TextStyle(
            fontSize: 16,
            color: Colors.black87,
          ),
        ),
      ),
    );
  }
}
