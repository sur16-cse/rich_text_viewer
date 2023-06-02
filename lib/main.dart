import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:rich_text_editor_viewer/rich_text_viewer/custom_rich_text_viewer.dart';

void main() async {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  Future<Map<String, dynamic>> _loadFileData() async {
    String filePath = "assets/dummy_data/quill.json";
    String jsonData = await rootBundle.loadString(filePath);
    final Map<String, dynamic> jsonResponse = jsonDecode(jsonData);
    return jsonResponse;
  }

  String extractRawDataFromJson(Map<String, dynamic> jsonDataResponse) {
    final Map<String, dynamic> questionData = jsonDataResponse['question'];
    final String rawData = questionData['question'];
    return rawData;
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<Map<String, dynamic>>(
      future: _loadFileData(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(child: CircularProgressIndicator());
        } else if (snapshot.hasError) {
          return Center(child: Text('Error: ${snapshot.error}'));
        } else if (snapshot.hasData) {
          final jsonDataResponse = snapshot.data;
          final htmlRawData = extractRawDataFromJson(jsonDataResponse!);
          final richTextViewer = RichTextViewer(htmlRawData);
          return MaterialApp(
            home: Scaffold(
              appBar: AppBar(
                title: const Text('Rich Text Viewer'),
              ),
              body: richTextViewer,
            ),
          );
        }
        return const Center(child: Text('No data available'));
      },
    );
  }
}