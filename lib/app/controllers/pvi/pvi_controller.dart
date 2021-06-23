import 'package:flutter_simulador_parcela/app/models/app/item_dropdown.dart';
import 'package:flutter_simulador_parcela/app/repositories/pvi/pvi_filtros_repositories.dart';
import 'package:mobx/mobx.dart';

part 'pvi_controller.g.dart';

class ControllerPVI = _ControllerPVI with _$ControllerPVI;

abstract class _ControllerPVI with Store {
  final PVIRepository repository;

  @observable
  ObservableFuture<List<ItemDropdDown>>? listItemsDropdDown;

  _ControllerPVI({required this.repository}) {
    getListItensDropDownManagement();
  }

  @action
  Future<List<ItemDropdDown>> getListItensDropDown(
      {required String endPoint}) async {
    List<ItemDropdDown> list =
        await repository.getItemsDropDown(nameEndPoint: endPoint);

    return list;
  }

  @action
  getListItensDropDownManagement() {
    listItemsDropdDown =
        repository.getItemsDropDown(nameEndPoint: 'gerencia').asObservable();
  }
}
