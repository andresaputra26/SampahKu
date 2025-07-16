import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:flutter_tflite/flutter_tflite.dart';
import './organic_page.dart';
import './inorganic_page.dart';
import 'dart:developer' as devtools;


class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  
  File? filePath;
  String label = "";
  double confidence = 0.0;

  // Load Model and Label
  Future<void> tfliteInit() async {
    // ignore: unused_local_variable
    String? res = await Tflite.loadModel(
      model: "assets/SampahKu_TFLiteModel.tflite",
      labels: "assets/label.txt",
    );
  }

  // Take Photo by Camera
  takePhoto() async {
    final ImagePicker picker = ImagePicker();
    final XFile? image = await picker.pickImage(source: ImageSource.camera);
    if (image == null) return;
    var imageMap = File(image.path);
    setState(() {
      filePath = imageMap;
    });
    var recognitions = await Tflite.runModelOnImage(path: image.path);
    if (recognitions == null) {
      devtools.log("Recognition is Null");
      return;
    }
    devtools.log(recognitions.toString());
    setState(() {
      confidence = (recognitions[0]["confidence"] * 100);
      label = recognitions[0]["label"].toString();
    });
  }

  // Pick Photo from Gallery
  pickFromGallery() async {
    final ImagePicker picker = ImagePicker();
    final XFile? image = await picker.pickImage(source: ImageSource.gallery);
    if (image == null) return;
    var imageMap = File(image.path);
    setState(() {
      filePath = imageMap;
    });
    var recognitions = await Tflite.runModelOnImage(path: image.path);
    if (recognitions == null) {
      devtools.log("Recognition is Null");
      return;
    }
    devtools.log(recognitions.toString());
    setState(() {
      confidence = (recognitions[0]["confidence"] * 100);
      label = recognitions[0]["label"].toString();
    });
  }
  
  // Get Label Page After Detection
  getPageForLabel(String label) {
    switch (label) {
      case "Organic":
        return const OrganicPage();
      case "Inorganic":
        return const InorganicPage();
    } 
  }

  @override
  void dispose() {
    super.dispose();
    Tflite.close();
  }

  @override
  void initState() {
    super.initState();
    tfliteInit();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.07),
            child: Container(
              width: MediaQuery.of(context).size.width * 0.79,
              height: MediaQuery.of(context).size.height * 0.365,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(25),
                image: const DecorationImage(image: AssetImage("images/home_page.png")),
              ),
              child: filePath == null ? const Text("") : ClipRRect(
                borderRadius: BorderRadius.circular(25),
                child: Image.file(
                  filePath!,
                  fit: BoxFit.cover,
                ),
              ), 
            ),
          ),
                
          Padding(
            padding: EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.01),
            child: Center(
              child: GestureDetector(
                onTap: () => Navigator.of(context).push(
                  PageRouteBuilder(
                    pageBuilder: (context, animation, secondaryAnimation) => getPageForLabel(label),
                    transitionDuration: const Duration(seconds: 2),
                  ),
                ),
                child: Text(
                  label,
                  style: TextStyle(
                    color: const Color(0xff42e12e),
                    fontFamily: "GoogleSans-Bold",
                    fontSize: MediaQuery.of(context).size.width * 0.062,
                  ),
                ),
              ),
            ),
          ),
                
          Center(
            child: Text(
              "The Accuracy is ${confidence.toStringAsFixed(0)}%",
              style: TextStyle(
                fontFamily: "GoogleSans-Regular",
                fontSize: MediaQuery.of(context).size.width * 0.052,
              ),
            ),
          ),
      
          Padding(
            padding: EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.01),
            child: ElevatedButton(
              onPressed: () => takePhoto(),
              style: ElevatedButton.styleFrom(
                fixedSize: Size.fromWidth(MediaQuery.of(context).size.width * 0.9),
                backgroundColor: const Color(0xff42e12e),
                padding: const EdgeInsets.symmetric(vertical: 10),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
              ),
              child: Text(
                "Take Photo",
                style: TextStyle(
                  color: Colors.white,
                  fontFamily: "GoogleSans-Regular",
                  fontSize: MediaQuery.of(context).size.width * 0.052,
                ),
              ),
            ),
          ),
          
          Padding(
            padding: EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.01),
            child: ElevatedButton(
              onPressed: () => pickFromGallery(), 
              style: ElevatedButton.styleFrom(
                fixedSize: Size.fromWidth(MediaQuery.of(context).size.width * 0.9),
                backgroundColor: const Color(0xff42e12e),
                padding: const EdgeInsets.symmetric(vertical: 10),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
              ),
              child: Text(
                "Pick from Gallery",
                style: TextStyle(
                  color: Colors.white,
                  fontFamily: "GoogleSans-Regular",
                  fontSize: MediaQuery.of(context).size.width * 0.052,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}