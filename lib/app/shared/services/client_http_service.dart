/* Desenvolvido por Leandro M. Loureiro */
/* GitHub https://github.com/leandromltec */
/* Linkedin - https://www.linkedin.com/in/leandro-loureiro-dev/ */

import 'package:dio/dio.dart';
import 'package:flutter_simulador_parcela/app/interfaces/client_http_interface.dart';
import 'package:flutter_simulador_parcela/app/shared/constants/url_api_constants.dart';

class ClientHttpService implements IClientHttpService {
  @override
  Future get(String endPoint) async {
    var dataAPI;

    try {
      final response = await Dio().get(BASE_URL_API + endPoint);
      if (response.statusCode != 200)
        dataAPI = null;
      else
        dataAPI = response.data;

      return dataAPI;
    } catch (e) {
      print("erro de api");
    }
  }
}
