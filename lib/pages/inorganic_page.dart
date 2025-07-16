import 'package:flutter/material.dart';
import '../widgets/desc_item.dart';

class InorganicPage extends StatelessWidget {
  const InorganicPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Color(0xff42e12e),
      body: DescItem(
        imageDescItem: "images/inorganic_pages.png", 
        titleDescItem: "Inorganic", 
        subtitleDescItem: "Inorganic Waste", 
        contentDescItem: "Sampah anorganik adalah jenis sampah yang berasal dari bahan-bahan non-alami atau buatan manusia yang sulit terurai secara alami. Contohnya meliputi plastik, kaca, logam, kertas, dan kaleng. Sampah ini membutuhkan waktu yang sangat lama untuk terurai, bahkan hingga ratusan tahun. Oleh karena itu, penting untuk mendaur ulang sampah anorganik agar dapat dimanfaatkan kembali dan mengurangi dampaknya terhadap lingkungan.",
      ),
    );
  }
}