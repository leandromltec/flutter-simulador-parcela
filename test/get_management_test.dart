import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_simulador_parcela/app/controllers/pvi/pvi_controller.dart';
import 'package:flutter_simulador_parcela/app/interfaces/client_http_interface.dart';
import 'package:flutter_simulador_parcela/app/models/app/item_dropdown.dart';
import 'package:flutter_simulador_parcela/app/shared/services/client_http_service.dart';
import 'package:flutter_test/flutter_test.dart';

class ClientHttpMock {
  final ClientHttpService clientHttp = new ClientHttpService();

  dynamic getURL() async {
    var json = await clientHttp.get('gerencia');
    return json;
  }
}

main() {
  test('Erro Gerência', () async {
    final ClientHttpService clientHttp = new ClientHttpService();
    List<dynamic> json = await clientHttp.get('gerencia');

    expect(json.length, 0);
  });

  /*test('OK API REST', () async {
    final api = await ClientHttpMock().getURL();

    expect(api, null);
  });*/
}
