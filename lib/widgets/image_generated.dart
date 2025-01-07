import 'package:flutter/material.dart';
import 'package:hf_ai_app/core/utils/image_saver.dart';
import 'package:hf_ai_app/core/utils/theme.dart';

class ImageGenerated extends StatelessWidget {
  const ImageGenerated({
    super.key,
    required this.res,
    required this.date,
  });

  final dynamic res;
  final DateTime date;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Image.memory(res),
        Positioned(
          right: 0,
          bottom: 0,
          child: IconButton(
              iconSize: 30,
              style: ButtonStyle(
                  iconColor: const WidgetStatePropertyAll(primary),
                  backgroundColor:
                      WidgetStatePropertyAll(secondary.withAlpha(100))),
              onPressed: () async {
                await ImageSaver(imageData: res, name: date.toString())
                    .saveImage();
                WidgetsBinding.instance.addPostFrameCallback(
                    (timeStamp) => WidgetsBinding.instance.addPostFrameCallback(
                          (timeStamp) {
                            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                                content: Center(
                                    child: Text(
                              'Image Saved',
                              style: Theme.of(context).textTheme.labelMedium,
                            ))));
                          },
                        ));
              },
              icon: const Icon(Icons.download_rounded)),
        )
      ],
    );
  }
}
