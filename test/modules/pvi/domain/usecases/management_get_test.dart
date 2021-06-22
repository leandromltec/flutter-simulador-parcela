
import 'package:flutter_simulador_parcela/modules/pvi/domain/entities/management.dart';
import 'package:flutter_simulador_parcela/modules/pvi/domain/usecases/management_get.dart';
import 'package:flutter_test/flutter_test.dart';

main() {
  final usecase = GetAllManagement();

  test('Lista de gerência', () async {
    final result = usecase.getAllManagement();

    //expect(result, isA<Right>());

    //expect(result | null, isA<List<Management>>());

  });
}
