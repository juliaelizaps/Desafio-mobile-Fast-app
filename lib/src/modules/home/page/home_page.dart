import 'package:fast_location/src/shared/colors/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';

import '../../../shared/components/app_button.dart';
import '../controller/home_controller.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final HomeController _controller = HomeController();
  TextEditingController searchController = TextEditingController();
  late ReactionDisposer errorReactDisposer;
  late ReactionDisposer errorRouteReactionDisposer;

  @override
  void initState() {
    super.initState();
    //_controller.loadData();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    //reactsToError();
    //reactsToRouterError();
  }

  @override
  void dispose() {
    super.dispose();
    searchController.dispose();
    errorReactDisposer();
    errorRouteReactionDisposer();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.appPageBackground,
      body: Padding(
        padding: const EdgeInsets.all(14.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Título
            Padding(
              padding: const EdgeInsets.only(top: 100.0, bottom: 70.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Icon(Icons.compare_arrows_rounded, color: AppColors.buttonColor),
                  SizedBox(width: 10.0),
                  Text(
                    'Fast Location',
                    style: TextStyle(
                      fontSize: 30.0,
                      fontWeight: FontWeight.bold,
                      color: AppColors.appTitleColor,
                    ),
                  ),
                ],
              ),
            ),
            // Seção 1: Resultado da busca (placeholder para futuras informações)
            Container(
              margin: const EdgeInsets.only(bottom: 16.0),
              padding: EdgeInsets.all(16.0),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12.0),
              ),
              child: Column(
                children: const [
                  Icon(Icons.directions, color: AppColors.buttonColor),
                  SizedBox(height: 8.0),
                  Text(
                    'Faça busca para localizar seu destino',
                    style: TextStyle(
                      fontSize: 18.0,
                      color: AppColors.appTextColor,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
            // Seção 2: Botão de localizar endereço
            Container(
              margin: EdgeInsets.only(bottom: 16.0),
              child: AppButton(
                label: 'Localizar endereço',
                action: () {
                  // Espaço para adicionar funcionalidade
                },
              ),
            ),
            // Texto "Últimos endereços localizados" com ícone
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Icon(Icons.location_on, color: AppColors.buttonColor),
                  SizedBox(width: 8.0),
                  Text(
                    'Últimos endereços localizados',
                    style: TextStyle(
                      fontSize: 16.0,
                      fontWeight: FontWeight.bold,
                      color: AppColors.appTextColor,
                    ),
                  ),
                ],
              ),
            ),
            // Seção 3: Locais recentes (placeholder para histórico)
            Container(
              margin: EdgeInsets.only(bottom: 16.0),
              padding: EdgeInsets.all(16.0),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12.0),
              ),
              child: const ListTile(
                leading: Icon(Icons.location_off),
                title: Text('Não há locais recentes'),
              ),
            ),
            // Seção 4: Histórico de endereços
            Container(
              margin: EdgeInsets.only(bottom: 16.0),
              child: AppButton(
                label: 'Histórico de endereços',
                action: () {
                  // Espaço para adicionar funcionalidade
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
