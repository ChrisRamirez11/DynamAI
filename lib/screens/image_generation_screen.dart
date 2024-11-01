import 'package:flutter/material.dart';
import 'package:hf_ai_app/providers/text_image_list_provider.dart';
import 'package:hf_ai_app/widgets/chat_text_box.dart';
import 'package:provider/provider.dart';

class Textgeneration extends StatefulWidget {
  const Textgeneration({super.key});

  @override
  State<Textgeneration> createState() => _TextgenerationState();
}

class _TextgenerationState extends State<Textgeneration> {
  final TextEditingController _textEditingController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final list = Provider.of<TextImageListProvider>(context).textImageList;
    return SafeArea(
      child: Scaffold(
        body: SizedBox(
          width: double.infinity,
          height: double.infinity,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Expanded(
                flex: 10,
                child: Column(
                  children: [
                    Expanded(
                      flex: 1,
                      child: ListView.builder(
                        itemCount: list.length,
                        itemBuilder: (context, index) => list[index],
                      ),
                    ),
                  ],
                ),
              ),
              chatTextBox(context: context,textController: _textEditingController)
            ],
          ),
        ),
      ),
    );
  }
}
