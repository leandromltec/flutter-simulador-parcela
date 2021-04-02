import 'package:flutter/material.dart';

Widget messageField(
    {Widget? icone,
    required String phraseInformationMessage,
    Color? colorPhraseInformationMessage}) {
  return Container(
      width: double.infinity,
      margin: EdgeInsets.only(left: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          icone!,
          SizedBox(
            width: 10,
          ),
          Text(
            phraseInformationMessage,
            style:
                TextStyle(fontSize: 12.0, color: colorPhraseInformationMessage),
          )
        ],
      ));
}
