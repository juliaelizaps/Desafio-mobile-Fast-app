import 'package:fast_location/src/modules/home/model/address_model.dart';

class HomeService {
  // Simulação de um banco de dados ou API
  final List<Map<String, dynamic>> _addressHistoryData = [
    {
      "cep": "12345-678",
      "publicPlace": "Rua A",
      "complement": "Apto 101",
      "neighborhood": "Bairro A",
      "city": "Cidade A",
      "state": "Estado A"
    },
    {
      "cep": "23456-789",
      "publicPlace": "Rua B",
      "complement": "",
      "neighborhood": "Bairro B",
      "city": "Cidade B",
      "state": "Estado B"
    },

  ];

  // Método para obter a lista de endereços
  Future<List<AddressModel>> getAddressHistoryList() async {
    // Simula um atraso de rede
    await Future.delayed(Duration(seconds: 2));
    return _addressHistoryData.map((data) => AddressModel.fromJsonLocal(data)).toList();
  }
}
