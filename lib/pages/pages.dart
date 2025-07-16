import 'package:flutter/material.dart';
import '../widgets/title_app.dart';
import './home_page.dart';
import './library_page.dart';

class Pages extends StatefulWidget {
  const Pages({super.key});

  @override
  State<Pages> createState() => _PagesState();
}

class _PagesState extends State<Pages> {
  
  int index = 0;

  PageController pageController = PageController(initialPage: 0);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: MediaQuery.of(context).size.height * 0.092,
        backgroundColor: const Color(0xff42e12e),
        title: const TitleApp(),
      ),
      body: PageView(
        controller: pageController,
        onPageChanged: (value) {
          setState(() {
            index = value;
          });
        },
        children: const [
          HomePage(),
          LibraryPage(),
        ],
      ),
      extendBody: true,
      bottomNavigationBar: Padding(
        padding: EdgeInsets.only(
          bottom: MediaQuery.of(context).size.height * 0.02, 
          left: MediaQuery.of(context).size.width * 0.04,
          right: MediaQuery.of(context).size.width * 0.04,
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(25),
          child: NavigationBarTheme(
            data: NavigationBarThemeData(
              backgroundColor: const Color(0xff42e12e),
              iconTheme: const MaterialStatePropertyAll(IconThemeData(color: Colors.white)),
              indicatorColor: const Color(0xFF57E943),
              labelTextStyle: MaterialStatePropertyAll(
                TextStyle(
                  color: Colors.white,
                  fontFamily: "GoogleSans-Regular", 
                  fontSize: MediaQuery.of(context).size.width * 0.037,
                ),
              ),
            ),
            child: NavigationBar(
              selectedIndex: index,
              onDestinationSelected: (value) {
                pageController.animateToPage(
                  value, 
                  duration: const Duration(milliseconds: 500), 
                  curve: Curves.ease,
                );
              },
              destinations: const [
                NavigationDestination(
                  icon: Icon(Icons.home), 
                  label: "Home",
                ),
                NavigationDestination(
                  icon: Icon(Icons.library_books), 
                  label: "Library",
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}