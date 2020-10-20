import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

TextSpan defaultTextSpan(String text) => TextSpan(
      text: text,
      style: TextStyle(
        color: Colors.black45,
        fontSize: 22,
      ),
    );

TextSpan highlightedTextSpan(String text) => TextSpan(
      text: text,
      style: TextStyle(
        fontSize: 46,
        fontStyle: FontStyle.italic,
        color: Colors.red,
        fontWeight: FontWeight.bold,
      ),
    );

TextSpan clickableTextSpan(String text) => TextSpan(
      text: text,
      recognizer: TapGestureRecognizer()..onTap = () => print(text),
      style: TextStyle(
          fontSize: 22,
          color: Colors.blue,
          decoration: TextDecoration.underline),
    );

TextSpan outlinedTextSpan(String text) => TextSpan(
      // put space beside text in order to make text look nice
      text: ' $text ',
      style: TextStyle(
          fontSize: 22, color: Colors.green, background: textBorderPaint),
    );

Paint textBorderPaint = Paint()
  ..color = Colors.green
  ..style = PaintingStyle.stroke
  ..strokeCap = StrokeCap.round
  ..strokeWidth = 2.0;
