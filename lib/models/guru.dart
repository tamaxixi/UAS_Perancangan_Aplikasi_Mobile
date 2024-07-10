class Guru {
  final int id;
  final String namaGuru;
  final String mataPelajaran;

  Guru({required this.id, required this.namaGuru, required this.mataPelajaran});

  factory Guru.fromJson(Map<String, dynamic> json) {
    return Guru(
      id: json['id'] ?? '',
      namaGuru: json['nama_guru'] ?? '',
      mataPelajaran: json['mata_pelajaran'] ?? '',
    );
  }
}
