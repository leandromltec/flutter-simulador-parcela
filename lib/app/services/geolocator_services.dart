/* Desenvolvido por Leandro M. Loureiro */
/* GitHub https://github.com/leandromltec */
/* Linkedin - https://www.linkedin.com/in/leandro-loureiro-dev/ */

import 'dart:io';

import 'package:flutter_simulador_parcela/app/models/map/currentLocation.dart';
import 'package:geolocator/geolocator.dart';
import 'package:geocoding/geocoding.dart';
import 'package:location/location.dart' as loc;

//Documentação pesquisada
//https://pub.dev/packages/geolocator
//https://pub.dev/packages/geocoding

class LocationService {
//Função de validação de permissões e acesso a localização atual
  Future<Position> _getGeolocatorPosition() async {
    bool serviceEnabled;
    LocationPermission permission;

    loc.Location location = loc.Location();

    //Verifica se o serviço de localização está habilitado
    /*serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      if (Platform.isAndroid) {
        //location.requestService();
        Geolocator.openLocationSettings();
      }

      //return Future.error('Location services are disabled.');
    }*/

    //Verifica se há permissão do usuário par acessar a localização
    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.whileInUse &&
          permission == LocationPermission.always) {
        Geolocator.openLocationSettings();
        return Future.error('Location permissions are denied.');
      }
    }

    //Verifica se o serviço de localização está habilitado
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      return Future.error('Location services are disabled.');
    }

    /*//Verifica se as permissões foram negadas permanentemente
    if (permission == LocationPermission.deniedForever) {
      return Future.error(
          'As permissões de localização são negadas permanentemente, não podemos solicitar permissões.\n'
          '(Location permissions are permanently denied, we cannot request permissions.)');
    }*/

    //Caso todas as permissões sejam concedidas retorna a posição da localização atual
    return await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.best);
  }

  Future<CurrentLocation> getCurrentLocation() async {
    Position position = await _getGeolocatorPosition();

    List<Placemark> listPlacemark =
        await placemarkFromCoordinates(position.latitude, position.longitude);

    if (listPlacemark.isNotEmpty)
      return CurrentLocation.fromPlacemark(
          listPlacemark[0], position.latitude, position.longitude);
    else
      return CurrentLocation();
  }
}
