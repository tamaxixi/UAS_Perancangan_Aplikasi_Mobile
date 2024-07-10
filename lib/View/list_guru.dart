import 'package:flutter/material.dart';
import '../controllers/guru_controller.dart';
import '../models/guru.dart';

class ListGuruScreen extends StatefulWidget {
  @override
  _ListGuruScreenState createState() => _ListGuruScreenState();
}

class _ListGuruScreenState extends State<ListGuruScreen> {
  final GuruController _controller = GuruController();
  late Future<List<Guru>> _gurusFuture;

  @override
  void initState() {
    super.initState();
    _gurusFuture = _controller.fetchGurus();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Daftar Guru'),
      ),
      backgroundColor:Colors.lightBlueAccent,
      body: FutureBuilder<List<Guru>>(
        future: _gurusFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return Center(child: Text('No data available'));
          } else {
            List<Guru> gurus = snapshot.data!;
            return ListView.builder(
              itemCount: gurus.length,
              itemBuilder: (context, index) {
                return _buildGuruCard(gurus[index]);
              },
            );
          }
        },
      ),
    );
  }

  Widget _buildGuruCard(Guru guru) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15.0),
      ),     
      elevation: 5,
      margin: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      child: ListTile(
        contentPadding: EdgeInsets.symmetric(vertical: 12, horizontal: 20),
        leading: CircleAvatar(
          backgroundImage: AssetImage('assets/images/profile.jpeg'),
          radius: 30,
        ),
        title: Text(
          guru.namaGuru,
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        subtitle: Text(guru.mataPelajaran ?? ''),
        onTap: () {
          // Implementasi aksi ketika guru di-tap
        },
      ),
    );
  }
}
