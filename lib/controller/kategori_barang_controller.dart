import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter_api/model/kategori_barang_model.dart';

class KategoriBarangController {
  final String apiUrl = "http://10.0.2.2:8000/api/";

  Future<List<KategoriBarangModel>> getKategoriBarang() async {
    var result = await http.get(Uri.parse("${apiUrl}barang/getAllKB/"));
    if (result.statusCode == 200) {
      var data = json.decode(result.body); //json to map
      List<KategoriBarangModel> kategoriBarang = []; //list of kategoriBarang
      for (var i in data) {
        //loop data
        KategoriBarangModel kategori =
            KategoriBarangModel.fromMap(i); //map to kategoriBarang
        kategoriBarang.add(kategori); //add kategoriBarang to list
      }
      return kategoriBarang;
    } else {
      throw Exception('Gagal mengambil data kategori barang');
    }
  }

  Future addKategoriBarang(KategoriBarangModel kategoriBarang) async {
    var result = await http.post(Uri.parse("${apiUrl}barang/addKB/"), body: {
      "nama_kategori_barang": kategoriBarang.nama,
    });
    if (result.statusCode == 200) {
      return jsonDecode(result.body);
    } else {
      throw Exception('Gagal menambahkan data kategori barang');
    }
  }

  Future deleteData(int id) async {
    try {
      var result = await http.post(Uri.parse("${apiUrl}barang/deleteKB/$id"));
      if (result.statusCode == 200) {
        return true;
      }
      return false;
    } catch (e) {
      print(e.toString());
      throw Exception('Gagal menghapus data kategori barang');
    }
  }

  Future updateKategoriBarang(int id, String nama) async {
    try {
      var result = await http.post(Uri.parse("${apiUrl}barang/updateKB/$id"),
          body: {"nama_kategori_barang": nama});
      if (result.statusCode == 200) {
        print("Kategori barang sukses dihapus");
        return true;
      }
      return false;
    } catch (e) {
      print(e.toString());
      throw Exception('Gagal memperbarui data kategori barang');
    }
  }
}
