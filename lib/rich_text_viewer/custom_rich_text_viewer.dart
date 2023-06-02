import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_html_math/flutter_html_math.dart';

class RichTextViewer extends StatelessWidget {
  final String htmlData;

  RichTextViewer(this.htmlData);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
          child: Html(
            data: htmlData,
            extensions: [
              // Add this to your extensions
              MathHtmlExtension(),
            ],
            // tagsList: Html.tags,
          ),
      ),
    );
  }
}