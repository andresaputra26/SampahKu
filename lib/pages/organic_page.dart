import 'package:flutter/material.dart';
import '../widgets/desc_item.dart';

class OrganicPage extends StatelessWidget {
  const OrganicPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Color(0xff42e12e),
      body: DescItem(
        imageDescItem: "images/organic_pages.png", 
        titleDescItem: "Organic", 
        subtitleDescItem: "Organic Waste", 
        contentDescItem: "Sampah organik adalah jenis sampah yang berasal dari bahan-bahan alami yang mudah terurai secara alami oleh mikroorganisme. Contohnya meliputi sisa makanan, kulit buah, daun kering, ampas kopi, dan limbah dapur lainnya. Sampah ini memiliki potensi untuk dijadikan kompos yang berguna sebagai pupuk alami bagi tanaman. Dengan pengelolaan yang baik, sampah organik tidak hanya membantu mengurangi volume sampah, tetapi juga mendukung keberlanjutan lingkungan.",
      ),
    );
  }
}