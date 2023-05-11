import 'dart:convert';

class KategoriBarangModel {
  final String nama;
  KategoriBarangModel({
    required this.nama,
  });

  KategoriBarangModel copyWith({
    String? nama,
  }) {
    return KategoriBarangModel(
      nama: nama ?? this.nama,
    );
  }

//ini diganti sesuai kolom tabel
  Map<String, dynamic> toMap() {
    return {
      'nama_kategori_barang': nama,
    };
  }

//ini diganti sesuai kolom tabel
  factory KategoriBarangModel.fromMap(Map<String, dynamic> map) {
    return KategoriBarangModel(
      nama: map['nama_kategori_barang'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory KategoriBarangModel.fromJson(String source) =>
      KategoriBarangModel.fromMap(json.decode(source));

  @override
  String toString() => 'KategoriBarangModel(nama: $nama)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is KategoriBarangModel && other.nama == nama;
  }

  @override
  int get hashCode => nama.hashCode;
}
