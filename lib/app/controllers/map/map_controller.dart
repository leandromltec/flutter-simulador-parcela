/* Desenvolvido por Leandro M. Loureiro */
/* GitHub https://github.com/leandromltec */
/* Linkedin - https://www.linkedin.com/in/leandro-loureiro-dev/ */

import 'package:map_launcher/map_launcher.dart';
import 'dart:io';

//Documentação pesquisada
//https://pub.dev/packages/map_launcher

//Utilizado para abrir o mapa padrão do celular (Android e IOS)
//Parâmetros latitude e longitude obrigatórios para chamada do mapa
openMapLancher(
    {required double latitude,
    required double longitude,
    required String city}) async {
  final maps = await MapLauncher.installedMaps;

  if (Platform.isIOS) {
    await MapLauncher.isMapAvailable(MapType.apple);
    await MapLauncher.showMarker(
        mapType: MapType.apple,
        coords: Coords(latitude, longitude),
        title: city,
        zoom: 16);
  } else
    await maps.first
        .showMarker(coords: Coords(latitude, longitude), title: city, zoom: 16);
}
