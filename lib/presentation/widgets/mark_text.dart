import 'package:flutter/material.dart';

Widget highlightAsteriskWords(
  String text, {
  TextStyle? styleHighlight,
  TextStyle? styleNormal,
}) {
  RegExp regExp = RegExp(r'\*(.*?)\*');
  List<InlineSpan> children = [];

  text.splitMapJoin(regExp, onMatch: (Match match) {
    children.add(TextSpan(
      text: match.group(1),
      style: styleHighlight ?? const TextStyle(fontWeight: FontWeight.bold),
    ));
    return '';
  }, onNonMatch: (String text) {
    children.add(TextSpan(text: text, style: styleNormal));
    return text;
  });

  return RichText(
    text: TextSpan(children: children),
  );
}
