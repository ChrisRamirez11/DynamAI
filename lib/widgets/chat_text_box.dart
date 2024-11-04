import 'package:flutter/material.dart';
import 'package:hf_ai_app/model/hfinference.dart';
import 'package:hf_ai_app/providers/selected_ai_provider.dart';
import 'package:hf_ai_app/utils/image_saver.dart';
import 'package:hf_ai_app/utils/theme.dart';
import 'package:hf_ai_app/widgets/text_message_widget.dart';

import '../providers/text_image_list_provider.dart';

Widget chatTextBox(
    {required BuildContext context,
    required TextEditingController textController,
    required TextImageListProvider listProvider,
    required List<Map<String, String>> aIListMap,
    required SelectedAiProvider selectedAiProvider,
    required void Function(String) changeEndpoint}) {
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
                onPressed: () => _getDialog(
                    context, aIListMap, selectedAiProvider, changeEndpoint),
                icon: const Icon(Icons.arrow_drop_down))),
        Expanded(
          flex: 4,
          child: TextField(
            minLines: 1,
            maxLines: 3,
            style: Theme.of(context).textTheme.labelMedium,
            controller: textController,
            decoration: InputDecoration(
              labelStyle: Theme.of(context).textTheme.bodySmall,
              labelText: selectedAiProvider.imageGenerationEndpoint,
              border: const OutlineInputBorder(),
            ),
          ),
        ),
        const SizedBox(height: 10),
        Expanded(
          flex: 1,
          child: ElevatedButton(
            onPressed: () async {
              if (textController.text.isEmpty) return;
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
                  selectedAiProvider.imageGenerationEndpoint, text);
              listProvider
                ..addToList(Stack(
                  children: [
                    Image.memory(res),
                    Positioned(
                      right: 0,
                      bottom: 0,
                      child: IconButton(
                          iconSize: 30,
                          style: ButtonStyle(
                              iconColor: const WidgetStatePropertyAll(primary),
                              backgroundColor: WidgetStatePropertyAll(
                                  secondary.withOpacity(0.5))),
                          onPressed: () async {
                            await ImageSaver(
                                    imageData: res, name: date.toString())
                                .saveImage();
                            WidgetsBinding.instance.addPostFrameCallback(
                                (timeStamp) => WidgetsBinding.instance
                                        .addPostFrameCallback(
                                      (timeStamp) {
                                        ScaffoldMessenger.of(context)
                                            .showSnackBar(SnackBar(
                                                content: Center(
                                                    child: Text(
                                          'Image Saved',
                                          style: Theme.of(context)
                                              .textTheme
                                              .labelMedium,
                                        ))));
                                      },
                                    ));
                          },
                          icon: const Icon(Icons.download_rounded)),
                    )
                  ],
                ))
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

_getDialog(BuildContext context, List<Map<String, String>> aIListMap,
    SelectedAiProvider selectedAiProvider, Function(String) changeEndpoint) {
  showDialog(
    context: context,
    builder: (context) => SimpleDialog(
      title: Center(
        child: Text(
          'AI Selector',
          style: Theme.of(context).textTheme.bodyLarge,
        ),
      ),
      children:
          getItems(context, aIListMap, selectedAiProvider, changeEndpoint),
    ),
  );
}

List<Widget> getItems(BuildContext context, List<Map<String, String>> aIListMap,
    SelectedAiProvider selectedAiProvider, Function(String) changeEndpoint) {
  return aIListMap.map((e) {
    return Column(
      children: [
        ListTile(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          onTap: () {
            changeEndpoint(e['endpoint']!);
            Navigator.pop(context);
          },
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
