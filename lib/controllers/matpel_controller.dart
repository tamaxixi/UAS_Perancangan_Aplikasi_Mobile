import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/matpel.dart';

class MatpelController {
  Future<List<Matpel>> fetchMatpels() async {
    final response = await http.get(Uri.parse('https://667cf3f53c30891b865e4a4c.mockapi.io/api/test/Matapelajaran'));
    
    if (response.statusCode == 200) {
      List<dynamic> data = json.decode(response.body);
      List<Matpel> matpels = data.map((json) => Matpel.fromJson(json)).toList();
      return matpels;
    } else {
      throw Exception('Failed to load matpels');
    }
  }
}
