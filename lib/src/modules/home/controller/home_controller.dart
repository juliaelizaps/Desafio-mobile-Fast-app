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

  // Adicione esta lista para armazenar os endereços
  @observable
  List<AddressModel> addressHistory = []; // Lista de endereços encontrados

  @action
  Future<void> buscarEndereco(String cep) async {
    isLoading = true;
    try {
      // Simulação de busca de endereço
      AddressModel endereco = await _service.getAddressByCep(cep);
      address = '${endereco.publicPlace}, ${endereco.neighborhood}, ${endereco.city}, ${endereco.state}';

      // Adiciona o endereço à lista de histórico
      addressHistory.add(endereco); // Armazena o endereço encontrado
      searchHistory.add(address!);
    } catch (e) {
      // Trate o erro adequadamente
      address = null;
    } finally {
      isLoading = false;
    }
  }

  @action
  List<AddressModel> getAddressHistoryList() {
    return addressHistory; // Retorna o histórico de endereços
  }

  @action
  void abrirGoogleMaps() {
    // Implementação para abrir o Google Maps com o endereço
  }
}
