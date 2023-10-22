// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

// ignore_for_file: avoid_print

import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';

Future<String> chatGPT(
  String apiKey,
  String prompt,
  int maxTokens,
  double temperature,
) async {
  final data = {
    'prompt': prompt,
    'max_tokens': maxTokens,
    'temperature': temperature,
  };

  final headers = {
    'Authorization':
        'Bearer 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',
    'Content-Type': 'application/json'
  };
  final request = http.Request(
    'POST',
    Uri.parse('https://api.openai.com/v1/engines/text-davinci-003/completions'),
  );
  request.body = json.encode(data);
  request.headers.addAll(headers);

  final httpResponse = await request.send();

  if (httpResponse.statusCode == 200) {
    final jsonResponse = json.decode(await httpResponse.stream.bytesToString());
    return jsonEncode(jsonResponse['choices'][0]['text']);
  } else {
    print(httpResponse.reasonPhrase);
    return '';
  }
}
