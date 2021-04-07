import 'package:flutter_simulador_parcela/app/models/app/item_dropdown.dart';

abstract class IPVIFilter {
  Future<List<ItemDropdDown>> getItemsDropDown();
}
