@Timeout(Duration(seconds: 60))

import 'package:flutter_simulador_parcela/app/shared/services/client_http_service.dart';
import 'package:flutter_test/flutter_test.dart';

Future<List<dynamic>> getDataAPIManagement() async {
  final ClientHttpService clientHttp = new ClientHttpService();
  List<dynamic> jsonData = await clientHttp.get('gerencia');

  return jsonData;
}

main() {
  //Inicia os testes
  setUpAll(() {
    print("Teste iniciado");
  });

  //Finaliza os testes
  tearDownAll(() {
    print("Teste finalizado");
  });

  group('Management:', () {
    test('Loading management', () async {
      var data = await getDataAPIManagement();

      expect(data, allOf([isNotEmpty, isNotNull]));
    });
  });
}
