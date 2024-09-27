import 'package:flutter/material.dart';

class EmptySearchComponent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        'Nenhum endereço encontrado.',
        style: TextStyle(fontSize: 16, color: Colors.grey),
      ),
    );
  }
}

