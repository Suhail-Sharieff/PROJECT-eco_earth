import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter_gemini/flutter_gemini.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:image_picker/image_picker.dart';
import 'package:lottie/lottie.dart';

class ChatBotPage extends StatefulWidget {
  const ChatBotPage({super.key});

  @override
  State<ChatBotPage> createState() =>
      _ChatBotPageState();
}

class _ChatBotPageState extends State<ChatBotPage> {
  final ImagePicker picker = ImagePicker();
  final controller = TextEditingController();
  final gemini = Gemini.instance;
  String? searchedText, result;
  bool _loading = false;

  Uint8List? selectedImage;

  bool get loading => _loading;

  set loading(bool set) => setState(() => _loading = set);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          if (searchedText != null)
            MaterialButton(
                color: Colors.blue.shade700,
                onPressed: () {
                  setState(() {
                    searchedText = null;
                    result = null;
                  });
                },
                child: Text('search: $searchedText')),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                    flex: 2,
                    child: loading
                        ? Lottie.asset('assets/lottie/ai.json')
                        : result != null
                        ? Markdown(
                      data: result!,
                      padding:
                      const EdgeInsets.symmetric(horizontal: 12),
                    )
                        : const Center(
                      child: Text('Search something!'),
                    ),
                  ),
                  if (selectedImage != null)
                    Expanded(
                      flex: 1,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(32),
                        child: Image.memory(
                          selectedImage!,
                          fit: BoxFit.cover,
                        ),
                      ),
                    )
                ],
              ),
            ),
          ),
          ChatInputBox(
            controller: controller,
            onClickCamera: () async {
              // Capture a photo.
              final XFile? photo =
              await picker.pickImage(source: ImageSource.camera);
      
              if (photo != null) {
                photo.readAsBytes().then((value) => setState(() {
                  selectedImage = value;
                }));
              }
            },
            onSend: () {
              if (controller.text.isNotEmpty && selectedImage != null) {
                searchedText = controller.text;
                controller.clear();
                loading = true;
      
                gemini.textAndImage(
                    text: searchedText!, images: [selectedImage!]).then((value) {
                  result = value?.output;
                  loading = false;
                });
              }
            },
          ),
        ],
      ),
    );
  }
}


class ChatInputBox extends StatelessWidget {
  final TextEditingController? controller;
  final VoidCallback? onSend, onClickCamera;

  const ChatInputBox({
    super.key,
    this.controller,
    this.onSend,
    this.onClickCamera,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(8),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          if (onClickCamera != null)
            Padding(
              padding: const EdgeInsets.all(4.0),
              child: IconButton(
                  onPressed: onClickCamera,
                  color: Theme.of(context).colorScheme.onSecondary,
                  icon: const Icon(Icons.file_copy_rounded)),
            ),
          Expanded(
              child: TextField(
                controller: controller,
                minLines: 1,
                maxLines: 6,
                cursorColor: Theme.of(context).colorScheme.inversePrimary,
                textInputAction: TextInputAction.newline,
                keyboardType: TextInputType.multiline,
                decoration: const InputDecoration(
                  contentPadding: EdgeInsets.symmetric(vertical: 10, horizontal: 4),
                  hintText: 'Message',
                  border: InputBorder.none,
                ),
                onTapOutside: (event) =>
                    FocusManager.instance.primaryFocus?.unfocus(),
              )),
          Padding(
            padding: const EdgeInsets.all(4),
            child: FloatingActionButton.small(
              onPressed: onSend,
              child: const Icon(Icons.send_rounded),
            ),
          )
        ],
      ),
    );
  }
}