/* Desenvolvido por Leandro M. Loureiro */
/* GitHub https://github.com/leandromltec */
/* Linkedin - https://www.linkedin.com/in/leandro-loureiro-dev/ */

//Compartilha textos e redireciona para aplicativos do aparelho

//Documentação pesquisada:
//Share (pacote de compartilhamento)
//https://pub.dev/packages/share

import 'package:flutter/material.dart';
import 'package:share/share.dart';

shareItem(
    {required BuildContext context,
    required String item,
    required String subjectTitle}) {
  final RenderBox box = context.findRenderObject() as RenderBox;
  Share.share(item,
      subject: subjectTitle,
      sharePositionOrigin: box.localToGlobal(Offset.zero) & box.size);
}
