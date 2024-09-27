import 'package:mobx/mobx.dart';
import '../model/address_model.dart';
import '../service/address_service.dart';


part 'home_controller.g.dart';

class HomeController = _HomeControllerBase with _$HomeController;

abstract class _HomeControllerBase with Store {
  final AddressService addressService;

  _HomeControllerBase(this.addressService);

  @observable
  String cep = '';

  @observable
  AddressModel? address;

  @observable
  bool isLoading = false;

  @observable
  String errorMessage = '';

  @action
  void setCep(String value) {
    cep = value;
  }

  @action
  Future<void> fetchAddress() async {
    isLoading = true;
    errorMessage = '';
    try {
      final result = await addressService.getAddressByCep(cep);
      if (result != null) {
        address = result;
      } else {
        errorMessage = 'Endereço não encontrado.';
      }
    } catch (e) {
      errorMessage = 'Erro ao buscar endereço.';
    } finally {
      isLoading = false;
    }
  }

  @action
  void reset() {
    address = null;
    errorMessage = '';
  }
}

