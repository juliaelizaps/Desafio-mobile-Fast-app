import 'package:cep_app/src/http/dio_config.dart';
import 'package:dio/dio.dart';
import '../model/address_model.dart';


class ApiRepository {
  final Dio _dio = DioConfig.dio;

  Future<AddressModel?> fetchAddressByCep(String cep) async {
    try {
      final response = await _dio.get('/$cep/json/');
      if (response.statusCode == 200) {
        return AddressModel.fromJson(response.data);
      } else {
        return null;
      }
    } catch (e) {
      print(e);
      return null;
    }
  }

  Future<List<AddressModel>> searchAddress(String query) async {

    return [];
  }
}
