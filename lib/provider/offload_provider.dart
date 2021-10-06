import 'package:assignment_app/model/offload_model.dart';
import 'package:flutter/foundation.dart';

class OffloadProvider extends ChangeNotifier {
  List<OffloadModel> offloadList = [
    OffloadModel(
      id: "1",
      title: "Haddock",
      quantity: 0,
    ),
    OffloadModel(
      id: "2",
      title: "Redfish",
      quantity: 0,
    ),
  ];

  // get the total number of quantity
  int get totalQuantity =>
      offloadList.fold(0, (previousValue, element) => previousValue + element.quantity!.toInt());

  void updateQuantityByIndex(int index, int quantity) {
    offloadList[index].quantity = quantity;
    notifyListeners();
  }
}
