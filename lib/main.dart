import 'package:flutter/material.dart';
import 'package:hf_ai_app/providers/selected_ai_provider.dart';
import 'package:hf_ai_app/providers/text_image_list_provider.dart';
import 'package:hf_ai_app/screens/custom_error_screen.dart';
import 'package:hf_ai_app/screens/home_screen.dart';
import 'package:hf_ai_app/utils/theme.dart';
import 'package:provider/provider.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  ErrorWidget.builder = (FlutterErrorDetails details) =>
      CustomErrorScreen(errorMsg: details.exceptionAsString());
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(providers: [
      ChangeNotifierProvider(create: (_) => TextImageListProvider(),),
      ChangeNotifierProvider(create: (_) => SelectedAiProvider(),)
    ],
      child: const MaterialAppFood());
  }
}

class MaterialAppFood extends StatelessWidget {
  const MaterialAppFood({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: themeDark,
        debugShowCheckedModeBanner: false,
        title: 'AiAPP',
        home: const HomeScreen());
  }
}
