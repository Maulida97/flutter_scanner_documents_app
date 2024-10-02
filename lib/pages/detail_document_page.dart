// ignore_for_file: public_member_api_docs, sort_constructors_first
// ignore_for_file: camel_case_types, prefer_typing_uninitialized_variables

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:scanner_project/core/spaces.dart';

import 'package:scanner_project/data/models/document_model.dart';

import '../core/colors.dart';

class DetailDocumentPage extends StatefulWidget {
  final DocumentModel document;
  const DetailDocumentPage({
    Key? key,
    required this.document,
  }) : super(key: key);

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
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          Text(
            widget.document.name!,
            style: const TextStyle(
              fontSize: 20.0,
              fontWeight: FontWeight.bold,
              color: AppColors.primary,
            ),
          ),
          const SpaceHeight(12),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                widget.document.category!,
                style: const TextStyle(
                  fontSize: 16.0,
                  color: AppColors.primary,
                ),
              ),
              Text(
                widget.document.createdAt!,
                style: const TextStyle(
                  fontSize: 16.0,
                  color: AppColors.primary,
                ),
              ),
            ],
          ),
          const SpaceHeight(12),
          ClipRRect(
            borderRadius: BorderRadius.circular(16),
            child: Image.file(
              width: double.infinity,
              File(widget.document.path!),
              fit: BoxFit.contain,
              colorBlendMode: BlendMode.colorBurn,
              color: AppColors.primary.withOpacity(0.2),
            ),
          ),
        ],
      ),
    );
  }
}
