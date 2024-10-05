import 'package:flutter/material.dart';
import '../colors/app_colors.dart';

class AppButton extends StatelessWidget {
  final String label;
  final Function()? action;

  const AppButton({
    Key? key,
    required this.label,
    this.action,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      child: ElevatedButton(
        onPressed: action,
        style: ElevatedButton.styleFrom(

            primary: AppColors.buttonColor, // Cor do botão
            onPrimary: Colors.white, // Cor do texto
            minimumSize: Size(double.infinity, 50), // Tamanho mínimo do botão
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.0),
            )
        ),
        child: Text(label),
      ),
    );
  }
}