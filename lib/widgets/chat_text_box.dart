import 'package:flutter/material.dart';
import 'package:hf_ai_app/model/hfinference.dart';
import 'package:hf_ai_app/utils/ai_list.dart';
import 'package:hf_ai_app/utils/image_saver.dart';
import 'package:hf_ai_app/widgets/text_message_widget.dart';

Widget chatTextBox(
    {required BuildContext context,
    required TextEditingController textController,required listProvider}) {
  return Expanded(
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
            controller: textController,
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
              final String text = textController.text;
              textController.clear();
              listProvider
                ..addToList(TextMessageWidget(isMe: true, text: text))
                ..addToList(const SizedBox(
                  height: 20,
                ));
              final DateTime date = DateTime.now();
              final res =
                  await sendTextGenerationRequest(AILists.textToImage[0], text);
              listProvider
                ..addToList(InkWell(
                    onTap: () =>
                        ImageSaver(imageData: res, name: date.toString())
                            .saveImage(),
                    child: Image.memory(res)))
                ..addToList(const SizedBox(
                  height: 20,
                ));
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
  );
}
