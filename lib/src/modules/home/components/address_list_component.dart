import 'package:flutter/material.dart';
import '../model/address_model.dart';

class AddressListComponent extends StatelessWidget {
  final List<AddressModel> addresses;
  final Function(AddressModel) onTap;

  const AddressListComponent({
    required this.addresses,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: addresses.length,
      itemBuilder: (context, index) {
        final address = addresses[index];
        return ListTile(
          title: Text(address.logradouro),
          subtitle: Text('${address.bairro}, ${address.localidade} - ${address.uf}'),
          onTap: () => onTap(address),
        );
      },
    );
  }
}
