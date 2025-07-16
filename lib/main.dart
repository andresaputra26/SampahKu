import 'package:flutter/material.dart';
import 'pages/getstartedpage.dart';

void main() {
  runApp(const SampahKuApp());
}

class SampahKuApp extends StatelessWidget {
  const SampahKuApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "SampahKuApp",
      debugShowCheckedModeBanner: false,
      darkTheme: ThemeData.dark(),
      home: const GetStartedPage(),
      builder: (context, child) => MediaQuery(
        data: MediaQuery.of(context).copyWith(textScaler: const TextScaler.linear(1.0)), 
        child: child!,
      ),
    );
  }
}