import 'package:dartz/dartz.dart';
import 'package:flutter_simulador_parcela/modules/pvi/domain/entities/management.dart';
import 'package:flutter_simulador_parcela/modules/pvi/domain/errors/error.dart';

abstract class RepositoryPVI {
  Future<Either<ErrorGetAllManagement, List<Management>>> get();
}
