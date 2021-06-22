import 'package:flutter_simulador_parcela/modules/pvi/domain/entities/management.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_simulador_parcela/modules/pvi/domain/errors/error.dart';
import 'package:flutter_simulador_parcela/modules/pvi/domain/repositories/pvi_repository.dart';

abstract class GetManagement {
  Future<Either<ErrorGetAllManagement, List<Management>>> getAllManagement();
}

class GetAllManagement implements GetManagement {
  final RepositoryPVI repository;

  GetAllManagement(this.repository);

  @override
  Future<Either<ErrorGetAllManagement, List<Management>>>
      getAllManagement() async {
    return repository.get();
  }
}
