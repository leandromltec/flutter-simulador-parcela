import 'package:flutter_simulador_parcela/app/interfaces/pvi/pvi_filtros_interface.dart';
import 'package:flutter_simulador_parcela/app/models/app/item_dropdown.dart';
import 'package:flutter_simulador_parcela/app/shared/services/client_http_services.dart';

class PVIFilterRepository implements IPVIFilter {
  @override
  Future<List<ItemDropdDown>> getItemsDropDown() async {
    final ClientHttpService clientHttp = new ClientHttpService();

    var jsonItemsDropDown = await clientHttp.get("urlAPI");

    List<ItemDropdDown> listItemDropDown = [];

    for (var itemDropDown in jsonItemsDropDown)
      listItemDropDown.add(ItemDropdDown.fromJson(itemDropDown));

    return listItemDropDown;
  }
}
