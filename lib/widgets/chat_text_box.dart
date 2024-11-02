import 'package:flutter/material.dart';
import 'package:hf_ai_app/model/hfinference.dart';
import 'package:hf_ai_app/utils/ai_list.dart';
import 'package:hf_ai_app/utils/image_saver.dart';
import 'package:hf_ai_app/widgets/text_message_widget.dart';

Widget chatTextBox(
    {required BuildContext context,
    required TextEditingController textController,
    required listProvider,
    required List<Map<String, String>> aIListMap}) {
  return Expanded(
    flex: 2,
    child: Row(
      children: [
        const SizedBox(
          width: 5,
        ),
        Expanded(
            flex: 1,
            child: IconButton(
                onPressed: () => _getDialog(context, aIListMap),
                icon: const Icon(Icons.arrow_drop_down))),
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
              //TODO switch to choose method based on ai motive
              listProvider
                ..addToList(TextMessageWidget(isMe: true, text: text))
                ..addToList(const SizedBox(
                  height: 20,
                ));
              final DateTime date = DateTime.now();
              final res = await sendImageGenerationRequest(
                  AILists.textToImage.elementAt(0)['endpoint']!, text);
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

_getDialog(BuildContext context, List<Map<String, String>> aIListMap) {
  showDialog(
    context: context,
    builder: (context) => SimpleDialog(
      title: Text(
        'AI Selector',
        style: Theme.of(context).textTheme.bodyLarge,
      ),
      children: getItems(context, aIListMap),
    ),
  );
}

List<Widget> getItems(
    BuildContext context, List<Map<String, String>> aIListMap) {
  return aIListMap.map((e) {
    return Column(
      children: [
        ListTile(shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          onTap: () {},
          title: Text(
            e['name']!,
            style: Theme.of(context).textTheme.bodyMedium,
          ),
          subtitle: Text(
            e['description']!,
            style: Theme.of(context).textTheme.labelSmall,
          ),
        )
      ],
    );
  }).toList();
}
