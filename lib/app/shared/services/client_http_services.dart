/* Desenvolvido por Leandro M. Loureiro */
/* GitHub https://github.com/leandromltec */
/* Linkedin - https://www.linkedin.com/in/leandro-loureiro-dev/ */

import 'package:dio/dio.dart';
import 'package:flutter_simulador_parcela/app/interfaces/client_http_interface.dart';

class ClientHttpService implements IClientHttpService {
  @override
  Future get(String urlAPI) async {
    var dataItemsAPI;

    final response = await Dio().get(urlAPI);
    if (response.statusCode != 200)
      dataItemsAPI = null;
    else
      dataItemsAPI = response.data;

    return dataItemsAPI;
  }
}
