import 'package:flutter/material.dart';
import 'package:uts_proyek/View/history_screen.dart';
import 'package:uts_proyek/View/kumpulan_quiz.dart';
import '../View/list_guru.dart';
import '../View/list_mapel.dart';
import '../View/profile_page.dart'; // Import halaman ProfilePage

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('Home', style: TextStyle(color: Colors.white)),
            Image.asset(
              'assets/images/logo.png',
              width: 120,
            ),
          ],
        ),
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
          child: ListView(
            children: [
              _buildCard(
                icon: Icons.book,
                title: 'Pilih Mata Pelajaran',
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => ListMatpelScreen()),
                  );
                },
              ),
              _buildCard(
                icon: Icons.person,
                title: 'Profil Pengguna',
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => ProfilePage()),
                  );
                },
              ),
              _buildCard(
                icon: Icons.quiz,
                title: 'Kumpulan Quiz',
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => KumpulanQuiz()),
                  );
                  // Implementasi aksi untuk menu Kumpulan Quiz jika diperlukan
                },
              ),
              _buildCard(
                icon: Icons.school,
                title: 'Daftar Guru',
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => ListGuruScreen()),
                  );
                },
              ),
              _buildCard(
                icon: Icons.history,
                title: 'History',
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => HistoryScreen()),
                  );
                  // Implementasi aksi untuk menu History jika diperlukan
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildCard({required IconData icon, required String title, required VoidCallback onTap}) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15.0),
      ),
      elevation: 5,
      margin: EdgeInsets.symmetric(vertical: 10),
      child: ListTile(
        leading: IconButton(
          icon: Icon(icon),
          onPressed: onTap,
          color: Colors.blueAccent,
        ),
        title: Text(
          title,
          style: TextStyle(fontSize: 16),
        ),
        onTap: onTap,
      ),
    );
  }
}
