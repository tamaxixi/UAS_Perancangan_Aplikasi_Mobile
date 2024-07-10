class Matpel {
  int? id;
  String? namaMataPelajaran;
  String? guru;
  String? kelas;
  int? jumlahJam;
  String? deskripsi;
  String? kurikulum;

  Matpel({
    this.id,
    this.namaMataPelajaran,
    this.guru,
    this.kelas,
    this.jumlahJam,
    this.deskripsi,
    this.kurikulum,
  });

  Matpel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    namaMataPelajaran = json['nama_mata_pelajaran'];
    guru = json['guru'];
    kelas = json['kelas'];
    jumlahJam = json['jumlah_jam'];
    deskripsi = json['deskripsi'];
    kurikulum = json['kurikulum'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['nama_mata_pelajaran'] = this.namaMataPelajaran;
    data['guru'] = this.guru;
    data['kelas'] = this.kelas;
    data['jumlah_jam'] = this.jumlahJam;
    data['deskripsi'] = this.deskripsi;
    data['kurikulum'] = this.kurikulum;
    return data;
  }
}
