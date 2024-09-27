import 'package:mobx/mobx.dart';
import 'package:fast_location/src/modules/home/model/address_model.dart';
import 'package:fast_location/src/modules/home/service/home_service.dart';

part 'home_controller.g.dart';

class HomeController = _HomeController with _$HomeController;

abstract class _HomeController with Store {
  final HomeService _service = HomeService();

  @observable
  bool isLoading = false;

  @observable
  String? address;

  @observable
  List<String> searchHistory = [];

  @action
  Future<void> buscarEndereco(String cep) async {
    isLoading = true;
    try {
      // Simulação de busca de endereço
      AddressModel endereco = await _service.getAddressByCep(cep);
      address = '${endereco.publicPlace}, ${endereco.neighborhood}, ${endereco.city}, ${endereco.state}';
      searchHistory.add(address!);
    } catch (e) {
      // Trate o erro adequadamente
      address = null;
    } finally {
      isLoading = false;
    }
  }

  @action
  void abrirGoogleMaps() {
    // Implementação para abrir o Google Maps com o endereço
  }
}
