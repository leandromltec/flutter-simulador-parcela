import 'package:flutter_simulador_parcela/modules/pvi/domain/entities/management.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_simulador_parcela/modules/pvi/domain/errors/error.dart';

abstract class GetManagement {
  Future<Either<ErrorGetAllManagement, List<Management>>> getAllManagement();
}

class GetAllManagement implements GetManagement {
  @override
  Future<Either<ErrorGetAllManagement, List<Management>>>
      getAllManagement() async {}
}
