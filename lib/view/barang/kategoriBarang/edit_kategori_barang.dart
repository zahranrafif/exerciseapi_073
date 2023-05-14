import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_api/controller/kategori_barang_controller.dart';
import 'package:flutter_api/view/barang/kategoriBarang/kategori_barang.dart';

class EditKategoriBarang extends StatefulWidget {
  const EditKategoriBarang({super.key, this.id, this.callupdate});
  final int? id;
  final String? callupdate;

  @override
  State<EditKategoriBarang> createState() => _EditKategoriBarangState();
}

class _EditKategoriBarangState extends State<EditKategoriBarang> {
  final kategoriBarangController = KategoriBarangController();
  String? namak;

  @override
  Widget build(BuildContext context) {
    var formkey = GlobalKey<FormState>();
    return Scaffold(
      appBar: AppBar(
        title: const Text('Halaman Edit Kategori Barang'),
      ),
      body: Form(
        key: formkey,
        child: ListView(
          padding: const EdgeInsets.all(16.0),
          children: [
            TextFormField(
              decoration: const InputDecoration(
                hintText: 'Nama Kategori Barang',
                labelText: 'Nama Kategori Barang',
              ),
              onChanged: (value) {
                namak = value;
              },
              initialValue: widget.callupdate,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Nama Kategori is Required';
                }
                return null;
              },
            ),
            const SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: () {
                if (formkey.currentState!.validate()) {
                  formkey.currentState!.save();
                  kategoriBarangController.updateKategoriBarang(
                      widget.id!, namak!);
                  Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const KategoriBarang()));

                  var snackBar = const SnackBar(
                      content:
                          Text("Data kategori barang berhasil di perbarui"));
                  ScaffoldMessenger.of(context).showSnackBar(snackBar);
                }
              },
              child: const Text('Update'),
            ),
          ],
        ),
      ),
    );
  }
}
