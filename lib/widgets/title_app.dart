import 'package:flutter/material.dart';

class TitleApp extends StatelessWidget {
  const TitleApp({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Image.asset(
          "images/icon_pages.png", 
          height: MediaQuery.of(context).size.height * 0.062,
        ),
    
        Padding(
          padding: EdgeInsets.only(left: MediaQuery.of(context).size.width * 0.022),
          child: Text(
            "SampahKu:\nOrganic Inorganic Classification",
            style: TextStyle(
              color: Colors.white,
              fontFamily: "GoogleSans-Bold",
              fontSize: MediaQuery.of(context).size.width * 0.052,
            ),
          ),
        ),
      ],
    );
  }
}