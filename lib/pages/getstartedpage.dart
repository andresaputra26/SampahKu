import 'package:flutter/material.dart';
import './pages.dart';

class GetStartedPage extends StatelessWidget {
  const GetStartedPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              width: MediaQuery.of(context).size.width * 0.5,
              height: MediaQuery.of(context).size.height * 0.5,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  fit: BoxFit.contain,
                  image: AssetImage("images/get_started_page.png")
                ),
              ),
            ),
          
            Padding(
              padding: EdgeInsets.only(left: MediaQuery.of(context).size.width * 0.11),
              child: Text(
                "SampahKu:\nOrganic and Inorganic Classification",
                style: TextStyle(
                  fontFamily: "GoogleSans-Bold",
                  fontSize: MediaQuery.of(context).size.width * 0.075,
                ),
              ),
            ),
          
            Padding(
              padding: EdgeInsets.only(
                top: MediaQuery.of(context).size.height * 0.01, 
                left: MediaQuery.of(context).size.width * 0.11,
              ),
              child: Text(
                "Your guide to recycling right",
                style: TextStyle(
                  fontFamily: "GoogleSans-Regular",
                  fontSize: MediaQuery.of(context).size.width * 0.052,
                ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: Padding(
        padding: EdgeInsets.only(
          bottom: MediaQuery.of(context).size.height * 0.02,
          left: MediaQuery.of(context).size.width * 0.04, 
          right: MediaQuery.of(context).size.width * 0.04,
        ),
        child: ElevatedButton(
          onPressed: () => Navigator.of(context).pushReplacement(
            PageRouteBuilder(
              pageBuilder: (context, animation, secondaryAnimation) => const Pages(),
              transitionDuration: const Duration(seconds: 2),
            ),
          ),
          style: ElevatedButton.styleFrom(
            backgroundColor: const Color(0xff42e12e),
            padding: const EdgeInsets.symmetric(vertical: 10),
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
          ),
          child: Text(
            "Let's Get Started!",
            style: TextStyle(
              color: Colors.white,
              fontFamily: "GoogleSans-Regular",
              fontSize: MediaQuery.of(context).size.width * 0.052,
            ),
          ),
        ),
      ),
    );
  }
}