
import 'dart:math';

import 'package:http/http.dart' as http;
import 'dart:convert';

Future sendTextGenerationRequest(String model, String input) async {
  final number = Random().nextInt(100000);
  final url = Uri.parse('https://api-inference.huggingface.co/models/$model');
  final headers = {
    "Authorization": "Bearer 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",
    "Content-Type": "application/json"
  };
  final body = jsonEncode({"inputs": input,
  "parameters":{
    "seed": number
  }
  });

  try {
    final response = await http.post(url, headers: headers, body: body);

    if (response.statusCode == 200) {
      return response.bodyBytes;
    } else {
      throw 'Error: ${response.statusCode}';
    }
  } catch (e) {
    throw 'Exception: $e';
  }
}