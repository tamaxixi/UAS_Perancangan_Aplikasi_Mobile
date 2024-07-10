import 'package:flutter/material.dart';
import 'quiz_screen.dart'; // Import halaman quiz untuk navigasi

class KumpulanQuiz extends StatelessWidget {
  final List<String> subjects = [
    'Matematika',
    'Bahasa Inggris',
    'Fisika',
    'Kimia',
    'Biologi',
    'Sejarah',
    'Geografi',
    'Ekonomi',
    'Seni Budaya',
    'Pendidikan Agama',
  ]; // Daftar semua mata pelajaran

  void _startQuiz(BuildContext context, String matpel) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => QuizScreen(matpel: matpel)),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Kumpulan Quiz'),
        backgroundColor: Colors.blue, // Warna latar belakang appbar
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
          itemCount: subjects.length,
          itemBuilder: (context, index) {
            return Card(
              elevation: 5,
              margin: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15.0),
              ),
              child: ListTile(
                leading: Icon(Icons.quiz, color: Colors.blue),
                title: Text(
                  subjects[index],
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.blue,
                  ),
                ),
                subtitle: Text(
                  'Kumpulan soal dan quiz terkait ${subjects[index]}',
                  style: TextStyle(fontSize: 14),
                ),
                onTap: () {
                  _startQuiz(context, subjects[index]); // Navigasi ke halaman quiz
                },
              ),
            );
          },
        ),
      ),
    );
  }
}
