import 'dart:convert';
import 'package:http/http.dart' as http;  // Importando http
import 'package:fast_location/src/modules/home/model/address_model.dart';

import '../model/address_model.dart';

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

  Future<List<AddressModel>> getAddressHistoryList() async {
    // Simula um atraso de rede
    await Future.delayed(Duration(seconds: 2));
    return _addressHistoryData.map((data) => AddressModel.fromJson(data)).toList();
  }

  // Método para obter um endereço pelo CEP
  Future<AddressModel> getAddressByCep(String cep) async {
    // Remove caracteres não numéricos do CEP
    final cleanedCep = cep.replaceAll(RegExp(r'[^0-9]'), '');

    final url = 'https://viacep.com.br/ws/$cleanedCep/json/';
    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      if (data['erro'] != null) {
        throw Exception('CEP não encontrado');
      }
      return AddressModel.fromJson(data);
    } else {
      throw Exception('Erro ao buscar endereço');
    }
  }
}
