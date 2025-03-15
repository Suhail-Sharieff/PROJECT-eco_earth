import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:image_picker/image_picker.dart';
import 'package:flutter_gemini/flutter_gemini.dart';
import 'package:lottie/lottie.dart';

class ClassifyWastePage extends StatefulWidget {
  const ClassifyWastePage({Key? key}) : super(key: key);

  @override
  State<ClassifyWastePage> createState() =>
      _ClassifyWastePageState();
}

class _ClassifyWastePageState extends State<ClassifyWastePage> {
  final ImagePicker picker = ImagePicker();
  final gemini = Gemini.instance;

  Uint8List? capturedImage;
  String result = "";
  bool loading = false;

  // Fixed prompt as provided.
  final String prompt =
      "Classify this e-waste image into one of these categories: repairable, sellable, recyclable, or hazardous. "
      "Prioritize in this order: 1) Sellable if the item seems functional or has valuable parts. "
      "2) Repairable if it shows signs of minor damage that can be fixed. "
      "3) Recyclable if the item is non-functional but contains materials that can be reused. "
      "4) Hazardous if it contains dangerous substances like lead or mercury. Provide a brief explanation.";

  Future<void> captureImage() async {
    final XFile? photo = await picker.pickImage(source: ImageSource.camera);
    if (photo != null) {
      final bytes = await photo.readAsBytes();
      setState(() {
        capturedImage = bytes;
      });
    }
  }

  Future<void> classifyImage() async {
    if (capturedImage == null) return;

    setState(() {
      loading = true;
      result = "";
    });

    try {
      final response = await gemini.textAndImage(
        text: prompt,
        images: [capturedImage!],
      );
      setState(() {
        result = response?.output ?? "No output received.";
      });
    } catch (e) {
      setState(() {
        result = "Error: $e";
      });
    } finally {
      setState(() {
        loading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Waste Classifier"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            // Button to capture an image.
            ElevatedButton(
              onPressed: captureImage,
              child: const Text("Capture Image"),
            ),
            const SizedBox(height: 10),
            // Display the captured image if available.
            if (capturedImage != null)
              Container(
                height: 200,
                width: double.infinity,
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey),
                ),
                child: Image.memory(
                  capturedImage!,
                  fit: BoxFit.cover,
                ),
              ),
            const SizedBox(height: 10),
            // Button to classify the image using the fixed prompt.
            ElevatedButton(
              onPressed: loading ? null : classifyImage,
              child: loading
                  ? const CircularProgressIndicator(color: Colors.white)
                  : const Text("Classify"),
            ),
            const SizedBox(height: 20),
            // Display result or Lottie animation while loading.
            Expanded(
              child: Center(
                child: loading
                    ? Lottie.asset('assets/lottie/ai.json', height: 200)
                    : SingleChildScrollView(
                  child: MarkdownBody(data: result,),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
