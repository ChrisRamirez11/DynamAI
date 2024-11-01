import 'package:flutter/material.dart';
import 'package:hf_ai_app/model/hfinference.dart';
import 'package:hf_ai_app/utils/ai_list.dart';
import 'package:hf_ai_app/utils/image_saver.dart';
import 'package:hf_ai_app/widgets/text_widget.dart';

class Textgeneration extends StatefulWidget {
  const Textgeneration({super.key});

  @override
  State<Textgeneration> createState() => _TextgenerationState();
}

class _TextgenerationState extends State<Textgeneration> {
  List<dynamic> list = [];
  final TextEditingController _textEditingController = TextEditingController();
  @override
  Widget build(BuildContext context) {
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
              Expanded(
                flex: 2,
                child: Row(
                  children: [
                    const SizedBox(
                      width: 10,
                    ),
                    Expanded(
                      flex: 4,
                      child: TextField(
                        minLines: 1,
                        maxLines: 2,
                        style: Theme.of(context).textTheme.labelMedium,
                        controller: _textEditingController,
                        decoration: const InputDecoration(
                          labelText: 'Enter text',
                          border: OutlineInputBorder(),
                        ),
                      ),
                    ),
                    const SizedBox(height: 10),
                    Expanded(
                      flex: 1,
                      child: ElevatedButton(
                        onPressed: () async {
                          final String text = _textEditingController.text;
                          setState(() {
                            _textEditingController.clear();
                            list
                              ..add(TextWidget(isMe: true, text: text))
                              ..add(const SizedBox(
                                height: 20,
                              ));
                          });
                          final DateTime date = DateTime.now();
                          final res = await sendTextGenerationRequest(
                              AILists.textToImage[0], text);
                          setState(() {
                            list
                              ..add(InkWell(
                                  onTap: () =>
                                    ImageSaver(
                                            imageData: res,
                                            name: date.toString())
                                        .saveImage(),
                                  child: Image.memory(res)))
                              ..add(const SizedBox(
                                height: 20,
                              ));
                          });
                        },
                        child: FittedBox(
                            child: Text(
                          'Send',
                          style: Theme.of(context).textTheme.bodySmall,
                        )),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
