import 'package:hive/hive.dart';
import '../model/address_model.dart';

class LocalRepository {
  final Box box = Hive.box('historyBox');

  Future<void> addAddress(AddressModel address) async {
    await box.add(address.toJson());
  }

  List<AddressModel> getAllAddresses() {
    return box.values
        .map((e) => AddressModel.fromJson(Map<String, dynamic>.from(e)))
        .toList();
  }
}
