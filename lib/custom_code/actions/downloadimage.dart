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
import 'package:path_provider/path_provider.dart';
import 'dart:io';

Future<List<String>> downloadimage(List<String> imageurls) async {
  print('Function downloadimage started with ${imageurls.length} image URLs');

  List<String> imagePaths = [];

  for (String url in imageurls) {
    try {
      print('Downloading image from URL: $url');

      final response = await http.get(Uri.parse(url));
      if (response.statusCode == 200) {
        final documentDirectory = await getApplicationDocumentsDirectory();
        final filePath = '${documentDirectory.path}/${url.split('/').last}';
        final file = File(filePath);

        print('Saving image to: $filePath');

        await file.writeAsBytes(response.bodyBytes);
        imagePaths.add(filePath);

        print('Successfully downloaded and saved image: $filePath');
      } else {
        print(
            'Failed to download image from URL: $url, Status code: ${response.statusCode}');
        throw Exception('Failed to download image: $url');
      }
    } catch (e) {
      print('Error downloading image from URL: $url, Error: $e');
    }
  }

  print('Completed downloading images');
  return imagePaths;
}

// End custom action code
// DO NOT REMOVE OR MODIFY THE CODE BELOW!
