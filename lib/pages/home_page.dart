// ignore_for_file: camel_case_types, prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';
import 'package:scanner_project/pages/latest_documents.dart';
import 'package:scanner_project/pages/menu_categories.dart';
import 'package:scanner_project/pages/save_documents_page.dart';

import '../core/colors.dart';
import '../core/spaces.dart';
import '../core/title_content.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Scanner fKartu"),
        centerTitle: true,
        elevation: 2,
        // actions: const [],
      ),
      body: Column(
        children: [
          Container(
            margin: const EdgeInsets.fromLTRB(16.0, 16, 16, 0),
            width: double.infinity,
            height: 120,
            decoration: BoxDecoration(
              color: AppColors.primary,
              borderRadius: BorderRadius.circular(16),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  'Scan Kartu atau Documents',
                  style: TextStyle(
                      color: AppColors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.w700),
                ),
                const SizedBox(
                  height: 8,
                ),
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const SaveDocumentsPage()));
                  },
                  child: const Text("scan Documents"),
                )
              ],
            ),
          ),
          const SpaceHeight(16.0),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: TitleContent(
              title: 'Categories',
              onSeeAllTap: () {},
            ),
          ),
          const SpaceHeight(12.0),
          const MenuCategories(),
          const SpaceHeight(12.0),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: TitleContent(
              title: 'Latest Documents',
              onSeeAllTap: () {},
            ),
          ),
          const SpaceHeight(12.0),
          const Expanded(child: LatestDocumentsPages()),
        ],
      ),
    );
  }
}
