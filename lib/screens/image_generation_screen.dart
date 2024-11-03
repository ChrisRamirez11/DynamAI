import 'package:flutter/material.dart';
import 'package:hf_ai_app/providers/selected_ai_provider.dart';
import 'package:hf_ai_app/providers/text_image_list_provider.dart';
import 'package:hf_ai_app/utils/ai_list.dart';
import 'package:hf_ai_app/widgets/chat_text_box.dart';
import 'package:provider/provider.dart';

class Textgeneration extends StatefulWidget {
  const Textgeneration({super.key});

  @override
  State<Textgeneration> createState() => _TextgenerationState();
}

class _TextgenerationState extends State<Textgeneration> {
  final ScrollController _scrollController = ScrollController();
  final TextEditingController _textEditingController = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    _scrollController.dispose();
    _textEditingController.dispose();
  }

//TODO change this later to a optional button that appears in the end of the view for going to the max extent(it must be in the init state)
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (_scrollController.hasClients) {
        _scrollController.jumpTo(_scrollController.position.maxScrollExtent);
      }
    });
  }

  final aiListMap = AILists.textToImage;
  @override
  Widget build(BuildContext context) {
    final selectedAiProvider = Provider.of<SelectedAiProvider>(context);
    final textImageListProvider = Provider.of<TextImageListProvider>(context);
    final list = textImageListProvider.textImageList;
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
                        controller: _scrollController,
                        itemCount: list.length,
                        itemBuilder: (context, index) => list[index],
                      ),
                    ),
                  ],
                ),
              ),
              chatTextBox(
                  context: context,
                  textController: _textEditingController,
                  listProvider: textImageListProvider,
                  aIListMap: aiListMap,
                  selectedAiProvider: selectedAiProvider,
                  changeEndpoint: selectedAiProvider.setImageGenerationEndpoint)
            ],
          ),
        ),
      ),
    );
  }
}
