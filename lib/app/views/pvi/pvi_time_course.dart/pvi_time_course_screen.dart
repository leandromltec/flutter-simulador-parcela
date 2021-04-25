import 'package:flutter/material.dart';
import 'package:flutter_simulador_parcela/app/views/components/app_components/divider.dart';
import 'package:flutter_simulador_parcela/app/views/components/app_components/title_pages.dart';
import 'package:flutter_simulador_parcela/app/views/page_template.dart';

class PVITimeCourseScreen extends StatefulWidget {
  @override
  _PVITimeCourseScreenState createState() => _PVITimeCourseScreenState();
}

class _PVITimeCourseScreenState extends State<PVITimeCourseScreen> {
  @override
  Widget build(BuildContext context) {
    return templatePage(
        columnSliverContentPage: Column(
      children: [
        titlePage("Período PVI"),
        dividerSession(),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
                margin: EdgeInsets.only(left: 25, right: 25),
                child: Text("Período")),
            Container(
              width: 30.0,
              child: Radio(
                value: 2,
                groupValue: 1,
                onChanged: (int? value) {
                  setState(() {});
                },
              ),
            ),
            Container(
                margin: EdgeInsets.only(right: 20), child: Text("Contínuo")),
            Container(
              width: 30.0,
              child: Radio(
                value: 2,
                groupValue: 1,
                onChanged: (int? value) {
                  setState(() {});
                },
              ),
            ),
            Container(
                margin: EdgeInsets.only(right: 20), child: Text("Diário")),
          ],
        ),
        dividerSession(),
        Wrap(
          //mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              color: Colors.red,
              width: 200,
              child: CheckboxListTile(
                title: Container(
                  width: 50,
                  color: Colors.yellow,
                  child: Text("Isenta (IN/SO)",
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 12.0,
                          fontWeight: FontWeight.bold)),
                ),
                value: true,
                onChanged: (value) {
                  setState(() {});
                },
                controlAffinity: ListTileControlAffinity.leading,
                activeColor: const Color(0xFF1565C0),
              ),
            ),
            Container(
              color: Colors.red,
              width: 200,
              child: CheckboxListTile(
                title: Text("PMM",
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 12.0,
                        fontWeight: FontWeight.bold)),
                value: true,
                onChanged: (value) {
                  setState(() {});
                },
                controlAffinity: ListTileControlAffinity.leading,
                activeColor: const Color(0xFF1565C0),
              ),
            ),
            Container(
              color: Colors.red,
              width: 200,
              child: CheckboxListTile(
                title: Text("NTT",
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 12.0,
                        fontWeight: FontWeight.bold)),
                value: true,
                onChanged: (value) {
                  setState(() {});
                },
                controlAffinity: ListTileControlAffinity.leading,
                activeColor: const Color(0xFF1565C0),
              ),
            ),
          ],
        )
      ],
    ));
  }
}
