import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_html_math/flutter_html_math.dart';

class RichTextViewer extends StatelessWidget {
  final String htmlData;

  RichTextViewer(this.htmlData);

  @override
  Widget build(BuildContext context) {
//     final htmlData = r"""
// <h1>HEADING 1</h1>
//   <h2>HEADING 2</h2>
//   <h3>HEADING 3</h3>
//   <h4>HEADING 4</h4>
//   <h5>HEADING 5</h5>
//   <h6>HEADING 6</h6>
//   <p>THIS IS THE PARAGRAPH</p>
//   <p><img title="download.jpg" src="https://gtet-images-public.s3.ap-south-1.amazonaws.com/stage/questions/b893cad0-5648-4afe-a7e2-004f6ee96d7b.jpeg" alt="" width="300" height="168"></p>
//   <p style="text-align: center;">THIS IS THE PARAGRAPH 2 IN CENTER</p>
//   <p style="text-align: left;"><math xmlns="http://www.w3.org/1998/Math/MathML"><mfrac><mn>1</mn><mn>2</mn></mfrac><mo>+</mo><msqrt><mn>2</mn></msqrt><mo>+</mo><msqrt><mn>3</mn><mo>+</mo><mn>6</mn><msqrt><mn>2</mn></msqrt></msqrt><mspace linebreak="newline"></mspace><mfenced open="|" close="|"><mtable><mtr><mtd><mn>1</mn></mtd><mtd><mn>2</mn></mtd><mtd><mn>3</mn></mtd></mtr><mtr><mtd><mn>4</mn></mtd><mtd><mn>4</mn></mtd><mtd><mn>3</mn></mtd></mtr><mtr><mtd><mn>4</mn></mtd><mtd><mn>5</mn></mtd><mtd><mn>7</mn></mtd></mtr></mtable></mfenced></math></p>
//
// """;
//     print(jsonContent);
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