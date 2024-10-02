// ignore_for_file: camel_case_types, prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';

class DetailDocumentPage extends StatefulWidget {
  const DetailDocumentPage({Key? key}) : super(key: key);

  @override
  State<DetailDocumentPage> createState() => _DetailDocumentPageState();
}

class _DetailDocumentPageState extends State<DetailDocumentPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Detail Document"),
        actions: const [],
      ),
      body: const Column(),
    );
  }
}
