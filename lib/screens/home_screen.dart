// ignore_for_file: unused_field

import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:image/image.dart' as img;
import 'package:tomato_disease_detection1/screens/diseases.dart';
import '../classifier/classifier.dart';

const _labelsFileName = 'assets/labels.txt';
const _modelFileName = 'withunknown1.tflite';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

enum _ResultStatus {
  notStarted,
  notFound,
  found,
}

class _HomeScreenState extends State<HomeScreen> {
  File? _image;
  bool _loading = false;
  List<dynamic>? _output;
  img.Image? _resizedImage;

  late double _deviceWidth;
  late double _deviceHeight;

  final picker = ImagePicker();

  _ResultStatus _resultStatus = _ResultStatus.notStarted;
  String _plantLabel = '';
  double _accuracy = 0.0;

  Classifier? _classifier;

  Future<void> _loadClassifier() async {
    debugPrint(
      'Start loading of Classifier with '
      'labels at $_labelsFileName, '
      'model at $_modelFileName',
    );

    final classifier = await Classifier.loadWith(
      labelsFileName: _labelsFileName,
      modelFileName: _modelFileName,
    );
    _classifier = classifier!;
  }

  @override
  void initState() {
    super.initState();
    _loadClassifier().then((value) {
      setState(() {});
    });
  }

  @override
  void dispose() {
    super.dispose();
  }

  pickImage() async {
    var image = await picker.pickImage(source: ImageSource.camera);
    setState(() {
      _image = File(image!.path);
    });
    _analyzeImage(_image!);
  }

  pickGallery() async {
    var image = await picker.pickImage(source: ImageSource.gallery);
    setState(() {
      _image = File(image!.path);
    });
    _analyzeImage(_image!);
  }

  @override
  Widget build(BuildContext context) {
    _deviceWidth = MediaQuery.of(context).size.width;
    _deviceHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Container(
        width: _deviceWidth,
        height: _deviceHeight,
        decoration: const BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                stops: [0.004, 1],
                colors: [Color(0xFF65FC00), Color(0xFF1BA500)])),
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          padding: EdgeInsets.symmetric(
              horizontal: _deviceWidth * 0.04, vertical: _deviceHeight * 0.054),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              const Text(
                "Tomato Disease Detection",
                style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.w900,
                    color: Colors.white),
              ),
              const Text(
                "Using Deep Learning Techniques",
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.black),
              ),
              const SizedBox(height: 10),
              Container(
                width: _deviceWidth * 0.96,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                        blurRadius: 7,
                        spreadRadius: 1,
                        offset: const Offset(0, 1),
                        color: Colors.black.withOpacity(0.5)),
                  ],
                ),
                child: const Column(
                  children: [
                    SizedBox(height: 5),
                    Text("Classes",
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        )),
                    SizedBox(height: 4),
                    Classes(),
                    SizedBox(height: 4),
                  ],
                ),
              ),
              SizedBox(height: _deviceHeight * 0.025),
              Container(
                width: _deviceWidth * 0.98,
                padding: EdgeInsets.symmetric(
                  vertical: _deviceHeight * 0.025,
                  horizontal: _deviceWidth * 0.025,
                ),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: [
                    BoxShadow(
                      blurRadius: 5,
                      spreadRadius: 1,
                      color: Colors.black.withOpacity(0.5),
                    )
                  ],
                ),
                child: Column(
                  children: [
                    Container(
                      width: _deviceWidth * 0.898,
                      height: _deviceHeight * 0.388,
                      decoration: BoxDecoration(
                        border: Border.all(width: 1),
                        borderRadius: BorderRadius.circular(6),
                      ),
                      child: _image != null
                          ? Image.file(_image!)
                          : const Center(child: Text("Image not Selected")),
                    ),
                    const SizedBox(height: 6),
                    _buildResultView(),
                    const SizedBox(height: 3),
                    ElevatedButton(
                      onPressed: pickImage,
                      style: ButtonStyle(
                        foregroundColor: const MaterialStatePropertyAll(
                          Colors.black,
                        ),
                        backgroundColor: const MaterialStatePropertyAll(
                          Color(0xFF58DD00),
                        ),
                        padding: MaterialStatePropertyAll(
                          EdgeInsets.symmetric(
                              horizontal: _deviceWidth * 0.3, vertical: 14),
                        ),
                      ),
                      child: const Text("From Camera"),
                    ),
                    SizedBox(height: _deviceHeight * 0.008),
                    ElevatedButton(
                      onPressed: pickGallery,
                      style: ButtonStyle(
                        foregroundColor:
                            const MaterialStatePropertyAll(Colors.black),
                        backgroundColor: const MaterialStatePropertyAll(
                          Color(0xFF58DD00),
                        ),
                        padding: MaterialStatePropertyAll(
                          EdgeInsets.symmetric(
                              horizontal: _deviceWidth * 0.3, vertical: 14),
                        ),
                      ),
                      child: const Text("From Gallery"),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _setAnalyzing(bool flag) {
    setState(() {
      _loading = flag;
    });
  }

  void _analyzeImage(File image) {
    _setAnalyzing(true);

    final imageInput = img.decodeImage(image.readAsBytesSync());

    if (imageInput == null) {
      // Handle the case when the image cannot be decoded
      _setAnalyzing(false);
      setState(() {
        _resultStatus = _ResultStatus.notFound;
        _plantLabel = '';
        _accuracy = 0.0;
      });
      return;
    }

    final resultCategory = _classifier?.predict(imageInput);

    if (resultCategory == null) {
      // Handle the case when prediction result is null
      _setAnalyzing(false);
      setState(() {
        _resultStatus = _ResultStatus.notFound;
        _plantLabel = '';
        _accuracy = 0.0;
      });
      return;
    }

    final result = resultCategory.score >= 0.5
        ? _ResultStatus.found
        : _ResultStatus.notFound;
    final plantLabel = resultCategory.label;
    final accuracy = resultCategory.score;

    _setAnalyzing(false);

    setState(() {
      _resultStatus = result;
      _plantLabel = plantLabel;
      _accuracy = accuracy;
    });
  }

  Widget _buildResultView() {
    var title = '';

    if (_resultStatus == _ResultStatus.notFound) {
      title = 'Fail to recognise';
    } else if (_resultStatus == _ResultStatus.found) {
      title = _plantLabel;
    } else {
      title = '';
    }

    //
    var accuracyLabel = '';
    if (_resultStatus == _ResultStatus.found) {
      accuracyLabel = ', Confidence: ${(_accuracy * 100).toStringAsFixed(2)}%';
    }

    return Column(
      children: [
        Text(
          "$title$accuracyLabel",
          style: const TextStyle(fontSize: 14),
        ),
      ],
    );
  }
}
