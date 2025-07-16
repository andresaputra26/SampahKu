import 'package:flutter/material.dart';

class Item extends StatelessWidget {
  const Item({
    super.key,
    required this.imageItem,
    required this.titleItem,
    required this.subtitleItem,
  });

  final String imageItem;
  final String titleItem;
  final String subtitleItem;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height * 0.15,
      margin: EdgeInsets.only(
        left: MediaQuery.of(context).size.width * 0.052,
        right: MediaQuery.of(context).size.width * 0.052,
      ),
      decoration: BoxDecoration(
        color: const Color(0xff42e12e),
        borderRadius: BorderRadius.circular(25),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.asset(imageItem),
          
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.01),
                child: Text(
                  titleItem,
                  style: TextStyle(
                    fontFamily: "GoogleSans-Bold",
                    fontSize: MediaQuery.of(context).size.width * 0.052,
                    color: Colors.white,
                  ),
                ),
              ),
    
              Text(
                subtitleItem,
                style: TextStyle(
                  fontFamily: "GoogleSans-Regular",
                  fontSize: MediaQuery.of(context).size.width * 0.042,
                  color: Colors.white,
                ),
              ),
            ],
          ),
        ],
      )
    );
  }
}