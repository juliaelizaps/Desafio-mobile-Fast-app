class AddressModel {
  String cep;  // Adicione esta linha
  String publicPlace;
  String complement;
  String neighborhood;
  String city;
  String state;

  AddressModel({
    required this.cep,  // Adicione esta linha
    required this.publicPlace,
    required this.complement,
    required this.neighborhood,
    required this.city,
    required this.state,
  });

  factory AddressModel.fromJson(Map<String, dynamic> json) {
    return AddressModel(
      cep: json['cep'],  // Adicione esta linha
      publicPlace: json['logradouro'],
      complement: json['complemento'] ?? '',
      neighborhood: json['bairro'],
      city: json['localidade'],
      state: json['uf'],
    );
  }
}
