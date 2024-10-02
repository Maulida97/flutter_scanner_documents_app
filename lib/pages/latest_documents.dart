// ignore_for_file: public_member_api_docs, sort_constructors_first
// ignore_for_file: camel_case_types, prefer_typing_uninitialized_variables

import 'dart:io';

import 'package:flutter/material.dart';

import 'package:scanner_project/data/models/document_model.dart';
import 'package:scanner_project/pages/detail_document_page.dart';

import '../core/colors.dart';
import '../core/spaces.dart';

class LatestDocumentsPages extends StatefulWidget {
  final List<DocumentModel> documents;
  const LatestDocumentsPages({
    Key? key,
    required this.documents,
  }) : super(key: key);

  @override
  State<LatestDocumentsPages> createState() => _LatestDocumentsPagesState();
}

class _LatestDocumentsPagesState extends State<LatestDocumentsPages> {
  @override
  Widget build(BuildContext context) {
    return GridView.builder(
        padding: const EdgeInsets.all(16.0),
        itemCount: widget.documents.length,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 16,
          mainAxisSpacing: 16,
          childAspectRatio: 3 / 2,
        ),
        itemBuilder: (context, index) {
          return Container(
            margin: const EdgeInsets.all(8.0),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
              color: Colors.grey[200],
            ),
            child: InkWell(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => DetailDocumentPage(
                            document: widget.documents[index])));
              },
              child: Column(
                children: [
                  Expanded(
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(8),
                      child: Image.file(
                        width: double.infinity,
                        File(widget.documents[index].path!),
                        fit: BoxFit.cover,
                        colorBlendMode: BlendMode.colorBurn,
                        color: AppColors.primary.withOpacity(0.2),
                      ),
                    ),
                  ),
                  const SpaceHeight(4),
                  Text(
                    widget.documents[index].name!,
                    style: const TextStyle(
                      fontSize: 12.0,
                      fontWeight: FontWeight.bold,
                      color: AppColors.primary,
                    ),
                  ),
                ],
              ),
            ),
          );
        });
  }
}
