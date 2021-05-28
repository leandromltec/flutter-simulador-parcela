import 'package:flutter_simulador_parcela/app/models/app/item_dropdown.dart';
import 'package:flutter_simulador_parcela/app/repositories/pvi/pvi_filtros_repositories.dart';
import 'package:mobx/mobx.dart';

part 'pvi_filtros_controller.g.dart';

class ControllerPviFiltros = _ControllerPviFiltros with _$ControllerPviFiltros;

abstract class _ControllerPviFiltros with Store {
  @observable
  ObservableFuture<List<ItemDropdDown>>? list;

  List<ItemDropdDown> list2 = [];

  _ControllerPviFiltros() {
    print("teste");
  }

  @action
  Future<List<ItemDropdDown>> getListItensDropDown() async {
    PVIFilterRepository repository = new PVIFilterRepository();

    List<ItemDropdDown> listItemsDropdDown =
        await repository.getItemsDropDown();

    return listItemsDropdDown;
  }

  @action
  loadItemsDropDown() {
    if (getListItensDropDown().asObservable().value == null) {
      return list2.add(ItemDropdDown(id: '1', title: 'teste'));
    } else
      return list = getListItensDropDown().asObservable();
  }
}
