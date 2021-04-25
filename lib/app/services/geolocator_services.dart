import 'package:geolocator/geolocator.dart';

//https://pub.dev/packages/geolocator

Future<Position> validateGeolocator() async {
  bool serviceEnabled;
  LocationPermission permission;

  //Verifica se o serviço de localização está habilitado
  serviceEnabled = await Geolocator.isLocationServiceEnabled();
  if (!serviceEnabled) {
    return Future.error(
        'Error - O Serviço de Localizaçao está desabilitado.\n (Location services are disabled.)');
  }

  //Verifica se há permissão do usuário par acessar a localização
  permission = await Geolocator.checkPermission();
  if (permission == LocationPermission.denied) {
    permission = await Geolocator.requestPermission();
    if (permission == LocationPermission.denied) {
      return Future.error(
          'Permissão de localização negada.\n (Location permissions are denied.)');
    }
  }

  //Verifica se as permissões foram negadas permanentemente
  if (permission == LocationPermission.deniedForever) {
    return Future.error(
        'As permissões de localização são negadas permanentemente, não podemos solicitar permissões.\n'
        '(Location permissions are permanently denied, we cannot request permissions.)');
  }

  //Caso todas as permissões sejam concedidas retorna a posição da localização atual
  return await Geolocator.getCurrentPosition();
}
