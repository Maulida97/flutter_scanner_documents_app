// ignore_for_file: camel_case_types, prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';

class LatestDocumentsPages extends StatefulWidget {
  const LatestDocumentsPages({Key? key}) : super(key: key);

  @override
  State<LatestDocumentsPages> createState() => _LatestDocumentsPagesState();
}

class _LatestDocumentsPagesState extends State<LatestDocumentsPages> {
  @override
  Widget build(BuildContext context) {
    return GridView.builder(
        padding: const EdgeInsets.all(16.0),
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
            child: Column(
              children: [
                Icon(
                  Icons.description,
                  size: 40.0,
                  color: Colors.grey[200],
                ),
                const SizedBox(
                  width: 70.0,
                  child: Text(
                    'Documents',
                    style: TextStyle(),
                    textAlign: TextAlign.center,
                  ),
                )
              ],
            ),
          );
        });
  }
}
