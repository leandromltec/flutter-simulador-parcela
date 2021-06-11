
import 'package:flutter/material.dart';
import 'package:flutter_simulador_parcela/app/views/components/app_components/checkbox_listtile.dart';
import 'package:flutter_simulador_parcela/app/views/components/app_components/datetime_formfield.dart';
import 'package:flutter_simulador_parcela/app/views/components/app_components/divider.dart';
import 'package:flutter_simulador_parcela/app/views/components/app_components/title_pages.dart';
import 'package:flutter_simulador_parcela/app/views/page_template.dart';


class PVITimeCourseScreen extends StatefulWidget {
  @override
  _PVITimeCourseScreenState createState() => _PVITimeCourseScreenState();
}

class _PVITimeCourseScreenState extends State<PVITimeCourseScreen> {
  double valueProgramado = 0;
  String textProgramado = "Normal";

  @override
  Widget build(BuildContext context) {
    return templatePage(
        widgetMaster: Column(
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
          //crossAxisAlignment: WrapCrossAlignment.center,
          alignment: WrapAlignment.center,
          //mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              //color: Colors.red,
              width: 200,
              child: CheckBoxListItemTile(
                titleCheckBox: "Isenta (IN/SO)",
              ),
            ),
            Container(
                //color: Colors.red,
                width: 200,
                child: CheckBoxListItemTile(
                  titleCheckBox: "PMM",
                )),
            Container(
                //color: Colors.red,
                width: 200,
                child: CheckBoxListItemTile(
                  titleCheckBox: "NTT",
                )),
            Container(
                //color: Colors.red,
                width: 200,
                child: CheckBoxListItemTile(
                  titleCheckBox: "PNM",
                )),
          ],
        ),
        dividerSession(),
        Column(
          children: [
            Row(
              children: [
                Container(
                  margin: EdgeInsets.only(left: 30),
                  child: Icon(
                    Icons.circle,
                    size: 10,
                    color: const Color(0xFF1565C0),
                  ),
                ),
                Container(
                    margin: EdgeInsets.only(left: 5, right: 30),
                    child: Text(
                      "Período Programado",
                      style: TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 14.0),
                    )),
                Container(
                  margin: EdgeInsets.only(left: 5),
                  child: Icon(
                    Icons.circle,
                    size: 10,
                    color: const Color(0xFF009232),
                  ),
                ),
                Container(
                    margin: EdgeInsets.only(left: 5, right: 30),
                    child: Text(
                      "Período Realizado",
                      style: TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 14.0),
                    )),
              ],
            ),
            SizedBox(height: 20),
            Row(
              children: [
                //Data Início Período Programado
                Container(
                    width: 160,
                    height: 60,
                    margin: EdgeInsets.only(left: 30),
                    child: dateTimeForm(labelText: "Data Início")),
                //Data Início Período Realizado
                Container(
                    width: 160,
                    height: 60,
                    margin: EdgeInsets.only(left: 30),
                    child: dateTimeForm(labelText: "Data Início")),
              ],
            ),
            Row(
              children: [
                //Data Início Período Realizado
                Container(
                    width: 160,
                    height: 60,
                    margin: EdgeInsets.only(left: 30),
                    child: hourMinuteForm(labelText: "Hora Início")),
                Container(
                    width: 160,
                    height: 60,
                    margin: EdgeInsets.only(left: 30),
                    child: hourMinuteForm(labelText: "Hora Início")),
              ],
            ),
          ],
        ),
        SizedBox(
          height: 20,
        ),
        Column(
          children: [
            Row(
              children: [
                //Data Início Período Programado
                Container(
                    width: 160,
                    height: 60,
                    margin: EdgeInsets.only(left: 30),
                    child: dateTimeForm(labelText: "Data Fim")),
                //Data Início Período Realizado
                Container(
                    width: 160,
                    height: 60,
                    margin: EdgeInsets.only(left: 30),
                    child: dateTimeForm(labelText: "Data Fim")),
              ],
            ),
            Row(
              children: [
                //Data Início Período Realizado
                Container(
                    width: 160,
                    height: 60,
                    margin: EdgeInsets.only(left: 30),
                    child: hourMinuteForm(labelText: "Hora Fim")),
                Container(
                    width: 160,
                    height: 60,
                    margin: EdgeInsets.only(left: 30),
                    child: hourMinuteForm(labelText: "Hora Fim")),
              ],
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              margin: EdgeInsets.only(left: 30, right: 30),
              child: SliderTheme(
                data: SliderTheme.of(context)
                    .copyWith(valueIndicatorColor: const Color(0xFF009232)),
                child: Slider(
                  min: 0,
                  max: 2,
                  label: '$textProgramado',
                  value: valueProgramado,
                  divisions: 2,
                  onChanged: (value) {
                    setState(() {
                      valueProgramado = value;

                      if (value == 0) textProgramado = "Normal";
                      if (value == 1) textProgramado = "Urgência";
                      if (value == 2) textProgramado = "Emergência";
                    });
                  },
                ),
              ),
            ),
            Center(
              child: Container(
                  child: Text("Prioridade: " + textProgramado.toString(),
                      style: TextStyle(
                          fontSize: 14, fontWeight: FontWeight.bold))),
            ),
            SizedBox(
              height: 100,
            )
          ],
        ),
      ],
    ));
  }
}
