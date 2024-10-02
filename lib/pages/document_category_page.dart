// ignore_for_file: public_member_api_docs, sort_constructors_first
// ignore_for_file: camel_case_types, prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';
import 'package:scanner_project/data/models/document_model.dart';

import 'package:scanner_project/pages/latest_documents.dart';

import '../data/datasources/document_local_datasource.dart';

class DocumentCategoryPage extends StatefulWidget {
  final String categoryTitle;
  const DocumentCategoryPage({Key? key, required this.categoryTitle})
      : super(key: key);

  @override
  State<DocumentCategoryPage> createState() => _DocumentCategoryPageState();
}

class _DocumentCategoryPageState extends State<DocumentCategoryPage> {
  List<DocumentModel> documents = [];
  loadData() async {
    documents = await DocumentLocalDatasource.instance
        .getDocumentByCategory(widget.categoryTitle);
    setState(() {});
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    loadData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Document ${widget.categoryTitle}'),
        actions: const [],
      ),
      body: Column(
        children: [
          Expanded(
              child: LatestDocumentsPages(
            documents: documents,
          )),
        ],
      ),
    );
  }
}
