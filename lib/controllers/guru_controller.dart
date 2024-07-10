import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/guru.dart';

class GuruController {
  final String apiUrl = 'https://667cf3f53c30891b865e4a4c.mockapi.io/api/test/daftar_guru';

  Future<List<Guru>> fetchGurus() async {
    final response = await http.get(Uri.parse(apiUrl));

    if (response.statusCode == 200) {
      List jsonResponse = json.decode(response.body);
      return jsonResponse.map((guru) => Guru.fromJson(guru)).toList();
    } else {
      throw Exception('Failed to load data');
    }
  }
}
