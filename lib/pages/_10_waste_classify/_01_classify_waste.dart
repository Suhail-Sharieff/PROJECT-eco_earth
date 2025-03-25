import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:image_picker/image_picker.dart';
import 'package:flutter_gemini/flutter_gemini.dart';
import 'package:lottie/lottie.dart';

class ClassifyWastePage extends StatefulWidget {
  const ClassifyWastePage({Key? key}) : super(key: key);

  @override
  State<ClassifyWastePage> createState() => _ClassifyWastePageState();
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
    // Placeholder with camera icon when no image is captured.
    final placeholder = Container(
      height: 250,
      width: double.infinity,
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey.shade400),
        borderRadius: BorderRadius.circular(12),
        color: Colors.grey.shade100,
      ),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.camera_alt, size: 50, color: Colors.grey.shade600),
            const SizedBox(height: 8),
            Text(
              'Tap to capture image',
              style: TextStyle(fontSize: 16, color: Colors.grey.shade600),
            ),
          ],
        ),
      ),
    );

    return Scaffold(
      appBar: AppBar(
        title: const Text("Waste Classifier"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            // Image capture area: shows a placeholder or the captured image.
            GestureDetector(
              onTap: captureImage,
              child: capturedImage != null
                  ? Container(
                height: 250,
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(color: Colors.grey.shade400),
                  image: DecorationImage(
                    image: MemoryImage(capturedImage!),
                    fit: BoxFit.cover,
                  ),
                ),
              )
                  : placeholder,
            ),
            const SizedBox(height: 16),
            // Classify button.
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: loading || capturedImage == null ? null : classifyImage,
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(vertical: 14),
                  textStyle: const TextStyle(fontSize: 18),
                ),
                child: loading
                    ? const SizedBox(
                  height: 24,
                  width: 24,
                  child: CircularProgressIndicator(
                    color: Colors.white,
                    strokeWidth: 2,
                  ),
                )
                    : const Text("Classify"),
              ),
            ),
            const SizedBox(height: 20),
            // Result display area.
            Expanded(
              child: Container(
                width: double.infinity,
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: Colors.grey.shade50,
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(color: Colors.grey.shade300),
                ),
                child: Center(
                  child: loading
                      ? Lottie.asset('assets/lottie/ai.json', height: 200)
                      : result.isEmpty
                      ? Text(
                    'Your result will appear here.',
                    style: TextStyle(color: Colors.grey.shade600, fontSize: 16),
                    textAlign: TextAlign.center,
                  )
                      : SingleChildScrollView(child: MarkdownBody(data: result)),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
