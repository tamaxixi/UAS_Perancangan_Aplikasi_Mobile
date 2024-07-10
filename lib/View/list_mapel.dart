import 'package:flutter/material.dart';
import 'detail_matpel.dart';
import '../models/matpel.dart';
import '../controllers/matpel_controller.dart'; // Import MatpelController untuk mengambil data

class ListMatpelScreen extends StatefulWidget {
  @override
  _ListMatpelScreenState createState() => _ListMatpelScreenState();
}

class _ListMatpelScreenState extends State<ListMatpelScreen> {
  final MatpelController _controller = MatpelController();
  late Future<List<Matpel>> _matpelsFuture;
  List<Matpel> _allMatpels = [];
  List<Matpel> _displayedMatpels = [];

  TextEditingController _searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _matpelsFuture = _controller.fetchMatpels();
  }

  void filterMatpels(String query) {
    setState(() {
      if (query.isEmpty) {
        _displayedMatpels = List.from(_allMatpels);
      } else {
        _displayedMatpels = _allMatpels.where((matpel) =>
            matpel.namaMataPelajaran!.toLowerCase().contains(query.toLowerCase())).toList();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Pilih Mata Pelajaran'),
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.blueAccent, Colors.lightBlueAccent],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Card(
                elevation: 5,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(25.0),
                ),
                child: TextField(
                  controller: _searchController,
                  onChanged: filterMatpels,
                  decoration: InputDecoration(
                    prefixIcon: Icon(Icons.search),
                    hintText: "Masukkan nama mata pelajaran",
                    border: InputBorder.none,
                    contentPadding: EdgeInsets.symmetric(vertical: 15.0, horizontal: 20.0),
                  ),
                ),
              ),
            ),
            Expanded(
              child: FutureBuilder<List<Matpel>>(
                future: _matpelsFuture,
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return Center(child: CircularProgressIndicator());
                  } else if (snapshot.hasError) {
                    return Center(child: Text('Error: ${snapshot.error}'));
                  } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                    return Center(child: Text('No data available'));
                  } else {
                    _allMatpels = snapshot.data!;
                    _displayedMatpels = List.from(_allMatpels); // Inisialisasi data yang ditampilkan
                    return ListView.builder(
                      itemCount: _displayedMatpels.length,
                      itemBuilder: (context, index) {
                        return GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => DetailMatpelScreen(matpel: _displayedMatpels[index]),
                              ),
                            );
                          },
                          child: Card(
                            elevation: 5,
                            margin: EdgeInsets.symmetric(vertical: 10, horizontal: 16),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15.0),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(12.0),
                              child: Row(
                                children: [
                                  Icon(Icons.book, size: 30, color: Colors.blue),
                                  SizedBox(width: 20),
                                  Expanded(
                                    child: Text(
                                      _displayedMatpels[index].namaMataPelajaran ?? '',
                                      style: TextStyle(fontSize: 18),
                                    ),
                                  ),
                                  Icon(Icons.arrow_forward_ios),
                                ],
                              ),
                            ),
                          ),
                        );
                      },
                    );
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
