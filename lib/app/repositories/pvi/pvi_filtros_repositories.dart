import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_simulador_parcela/app/interfaces/pvi/pvi_filtros_interface.dart';
import 'package:flutter_simulador_parcela/app/models/app/item_dropdown.dart';
import 'package:flutter_simulador_parcela/app/shared/services/client_http_service.dart';

class PVIRepository implements IPVIFilter {
  
  
  Future<List<ItemDropdDown>> getItemsDropDown({required String nameEndPoint}) async {
    final ClientHttpService clientHttp = new ClientHttpService();

    var jsonItemsDropDown = await clientHttp.get(nameEndPoint);

    List<ItemDropdDown> listItemDropDown = [];

    for (var itemDropDown in jsonItemsDropDown)
      listItemDropDown.add(ItemDropdDown.fromJson(itemDropDown));

    return listItemDropDown;
  }
}
