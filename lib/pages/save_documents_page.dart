// ignore_for_file: public_member_api_docs, sort_constructors_first
// ignore_for_file: camel_case_types, prefer_typing_uninitialized_variables

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../core/colors.dart';
import '../data/datasources/document_local_datasource.dart';
import '../data/models/document_model.dart';

class SaveDocumentsPage extends StatefulWidget {
  final String pathImage;
  const SaveDocumentsPage({
    Key? key,
    required this.pathImage,
  }) : super(key: key);

  @override
  State<SaveDocumentsPage> createState() => _SaveDocumentsPageState();
}

class _SaveDocumentsPageState extends State<SaveDocumentsPage> {
  TextEditingController? nameController;
  String? selectCategory;

  final List<String> categoires = [
    'Kartu',
    'Nota',
    'Surat',
  ];

  @override
  void initState() {
    super.initState();
    nameController = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Save Document'),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: [
          SizedBox(
              width: double.infinity,
              height: 200,
              child: ClipRRect(
                  borderRadius: BorderRadius.circular(16),
                  child: Image.file(File(widget.pathImage)))),
          const SizedBox(height: 16.0),
          TextFormField(
            controller: nameController,
            decoration: const InputDecoration(
              labelText: 'Nama Dokumen',
            ),
          ),
          const SizedBox(height: 16.0),
          DropdownButtonFormField<String>(
            value: selectCategory,
            onChanged: (String? value) {
              setState(() {
                selectCategory = value;
              });
            },
            items: categoires
                .map((e) => DropdownMenuItem<String>(
                      value: e,
                      child: Text(e),
                    ))
                .toList(),
            decoration: const InputDecoration(
              labelText: 'Kateogri',
            ),
          ),
          const SizedBox(height: 16.0),
        ],
      ),
      bottomNavigationBar: InkWell(
        onTap: () {
          // save document
          DocumentModel model = DocumentModel(
            name: nameController!.text,
            path: widget.pathImage,
            category: selectCategory!,
            createdAt: DateFormat('yyyy-MM-ddTHH:mm:ss').format(DateTime.now()),
          );
          DocumentLocalDatasource.instance.saveDocument(model);
          Navigator.pop(
            context,
          );
          const snackBar = SnackBar(
            content: Text('Dokumen Tersimpan'),
            backgroundColor: AppColors.primary,
          );
          ScaffoldMessenger.of(context).showSnackBar(snackBar);
        },
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: 52,
          margin: const EdgeInsets.all(16.0),
          decoration: BoxDecoration(
            color: AppColors.primary,
            borderRadius: BorderRadius.circular(16),
          ),
          child: const Center(
            child: Text(
              "Simpan Dokumen",
              style: TextStyle(
                fontSize: 16.0,
                fontWeight: FontWeight.bold,
                color: AppColors.white,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
