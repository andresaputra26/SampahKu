import 'package:flutter/material.dart';
import '../widgets/item.dart';
import './organic_page.dart';
import './Inorganic_page.dart';

class LibraryPage extends StatelessWidget {
  const LibraryPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          SizedBox(height: MediaQuery.of(context).size.height * 0.022),

          GestureDetector(
            onTap: () => Navigator.of(context).push(MaterialPageRoute(builder: (context) => const OrganicPage())),
            child: const Item(
              imageItem: "images/organic_pages.png",
              titleItem: "Organic",
              subtitleItem: "Organic Waste",
            ),
          ),

          SizedBox(height: MediaQuery.of(context).size.height * 0.022),

          GestureDetector(
            onTap: () => Navigator.of(context).push(MaterialPageRoute(builder: (context) => const InorganicPage())),
            child: const Item(
              imageItem: "images/inorganic_pages.png",
              titleItem: "Inorganic",
              subtitleItem: "Inorganic Waste",
            ),
          ),

          SizedBox(height: MediaQuery.of(context).size.height * 0.022),
        ],
      ),
    );
  }
}