import 'package:flutter/material.dart';
import '../model/address_model.dart';

class LastAddressComponent extends StatelessWidget {
  final AddressModel address;
  final VoidCallback onRoute;

  const LastAddressComponent({
    required this.address,
    required this.onRoute,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(address.logradouro),
      subtitle: Text('${address.bairro}, ${address.localidade} - ${address.uf}'),
      trailing: IconButton(
        icon: Icon(Icons.map),
        onPressed: onRoute,
      ),
    );
  }
}
