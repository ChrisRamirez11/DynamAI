import 'dart:io';
import 'dart:math';
import 'dart:developer' as dev;

import 'package:hf_ai_app/utils/consts.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

Future sendImageGenerationRequest(String model, String input) async {
  final number = Random().nextInt(100000);
  final url = Uri.parse('${Consts.hfApi}$model');
  final headers = {
    "Authorization": "Bearer ${Consts.hfToken}",
    "Content-Type": "application/json"
  };
  final body = jsonEncode({
    "inputs": input,
    "parameters": {"seed": number}
  });

  try {
    dev.log(model);
    final response = await http.post(url, headers: headers, body: body);

    if (response.statusCode >= 200 && response.statusCode < 300) {
      return response.bodyBytes;
    } else {
      throw HttpException(
          'Error: ${response.statusCode} - ${response.reasonPhrase}');
    }
  } catch (e) {
    // Puedes lanzar una excepción personalizada o registrar el error
    throw Exception(
        'An error occurred while making the HTTP request: $e');
  }
}
