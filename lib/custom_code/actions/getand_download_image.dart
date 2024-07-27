// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'dart:convert';
import 'package:http/http.dart' as http;

Future<List<String>> getandDownloadImage(String? prompt) async {
  // Add your function code here!

  if (prompt == null || prompt.isEmpty) {
    throw Exception('Prompt cannot be null or empty');
  }

  final String apiKey = 'c767a347-672d-40a2-aa40-5c800d2ee927';
  final String generateUrl =
      'https://cloud.leonardo.ai/api/rest/v1/generations';
  final String statusUrl = 'https://cloud.leonardo.ai/api/rest/v1/generations';

  // Generate image
  final response = await http.post(
    Uri.parse(generateUrl),
    headers: {
      'Authorization': 'Bearer $apiKey',
      'Content-Type': 'application/json',
      'accept': 'application/json',
    },
    body: jsonEncode({
      'height': 512,
      'prompt': prompt,
      'modelId': 'aa77f04e-3eec-4034-9c07-d0f619684628',
      'width': 512,
      'alchemy': true,
      'photoReal': true,
      'photoRealVersion': 'v2',
      'presetStyle': 'CINEMATIC',
    }),
  );

  if (response.statusCode != 200) {
    throw Exception('Failed to generate image: ${response.body}');
  }

  final generationId =
      jsonDecode(response.body)['sdGenerationJob']['generationId'];

  // Check status and download image URLs
  List<String> imageUrls = [];
  while (true) {
    final statusResponse = await http.get(
      Uri.parse('$statusUrl/$generationId'),
      headers: {
        'Authorization': 'Bearer $apiKey',
        'accept': 'application/json',
      },
    );

    if (statusResponse.statusCode != 200) {
      throw Exception(
          'Failed to check generation status: ${statusResponse.body}');
    }

    final statusData = jsonDecode(statusResponse.body)['generations_by_pk'];
    if (statusData['status'] == 'COMPLETE' &&
        statusData['generated_images'] != null) {
      for (var image in statusData['generated_images']) {
        imageUrls.add(image['url']);
      }
      break;
    }

    await Future.delayed(Duration(seconds: 10));
  }

  return imageUrls;
}

// End custom action code
// DO NOT REMOVE OR MODIFY THE CODE BELOW!
