/* Desenvolvido por Leandro M. Loureiro */
/* GitHub https://github.com/leandromltec */
/* Linkedin - https://www.linkedin.com/in/leandro-loureiro-dev/ */

//Documentação pesquisada sobre factory
//https://dart.dev/guides/language/language-tour#factory-constructors

class CurrentLocation {
  double? latitude;
  double? longitude;
  String? street;
  String? district;
  String? city;
  String? state;
  String? country;

  CurrentLocation(
      {this.latitude,
      this.longitude,
      this.street,
      this.district,
      this.city,
      this.state,
      this.country});

  //factory - construtor não necessita criar uma  nova instânca permitindo retornar a própria
  factory CurrentLocation.fromPlacemark(
      placemark, positionLatitude, positionLongitude) {
    CurrentLocation location = CurrentLocation();

    location.latitude = positionLatitude;
    location.longitude = positionLongitude;

    location.street = placemark.street;
    location.district = placemark.subLocality;
    location.city = placemark.subAdministrativeArea;
    location.state = placemark.administrativeArea;

    return location;
  }
}
