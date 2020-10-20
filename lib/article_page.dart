import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:testing_richtext/utils/my_text_spans.dart';

class ArticlePage extends StatelessWidget {
  final myTextSpans = <String, Function>{
    'a': (String text) => highlightedTextSpan(text),
    'b': (String text) => clickableTextSpan(text),
    'c': (String text) => outlinedTextSpan(text),
    'z': (String text) => defaultTextSpan(text),
  };
  final article =
      'RichText helps to create {{aHighlighted}}, \n{{bClickable}}, {{cOutlinedText}}. \nSay Hi to RichText ';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Flutter RichText'),
      ),
      body: Center(
        child: RichText(
          textAlign: TextAlign.center,
          text: TextSpan(children: decorateArticle(article)),
        ),
      ),
    );
  }

  List<InlineSpan> decorateArticle(String article) {
    var childern = <InlineSpan>[];

    article.split('{{').forEach((element) {
      if (element.contains("}}")) {
        childern.add(myTextSpans[element.split('}}')[0].substring(0, 1)](
            element.split('}}')[0].substring(1)));
        if (!element.endsWith("}}")) {
          childern.add(myTextSpans['z'](element.split('}}')[1]));
        }
      } else {
        childern.add(myTextSpans['z'](element));
      }
    });

    return childern;
  }
}
