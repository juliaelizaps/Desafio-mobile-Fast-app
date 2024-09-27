import '../model/address_model.dart';
import '../repositories/api_repository.dart';
import '../repositories/local_repository.dart';

class AddressService {
  final ApiRepository apiRepository;
  final LocalRepository localRepository;

  AddressService({
    required this.apiRepository,
    required this.localRepository,
  });

  Future<AddressModel?> getAddressByCep(String cep) async {
    final address = await apiRepository.fetchAddressByCep(cep);
    if (address != null) {
      await localRepository.addAddress(address);
    }
    return address;
  }

  List<AddressModel> getHistory() {
    return localRepository.getAllAddresses();
  }
}
