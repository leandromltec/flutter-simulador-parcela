import 'package:dartz/dartz.dart';
import 'package:flutter_simulador_parcela/modules/pvi/domain/entities/management.dart';
import 'package:flutter_simulador_parcela/modules/pvi/domain/errors/error.dart';
import 'package:flutter_simulador_parcela/modules/pvi/domain/repositories/pvi_repository.dart';
import 'package:flutter_simulador_parcela/modules/pvi/domain/usecases/management_get.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

class PVIRepositoryMock extends Mock implements RepositoryPVI {
  @override
  Future<Either<ErrorGetAllManagement, List<Management>>> get() {
    
  }
}

main() {
  final repository = PVIRepositoryMock();

  final usecase = GetAllManagement(repository);

  test('Lista de gerência', () async {
    final result = usecase.getAllManagement();

    //expect(result, isA<Right>());

    //expect(result | null, isA<List<Management>>());
  });
}
