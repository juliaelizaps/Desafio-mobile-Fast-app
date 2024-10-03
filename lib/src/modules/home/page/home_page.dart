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
              padding: const EdgeInsets.only(top: 60.0, bottom: 30.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Icon(Icons.multiple_stop_rounded, color: AppColors.buttonColor, size: 35,),
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
            Container(
              height: 170.0,
              margin: const EdgeInsets.only(bottom: 16.0),
              padding: EdgeInsets.all(16.0),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10.0),
              ),
              child: Column(
                children: const [
                  Icon(
                      Icons.directions,
                      size: 70,
                      color: AppColors.buttonColor),
                  SizedBox(height: 8.0),
                  Text(
                    'Faça uma busca para localizar seu destino.',
                    style: TextStyle(
                      fontSize: 18.0,
                      fontWeight: FontWeight.bold,
                      color: AppColors.appTextColor,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
            // localizar endereço
            Container(
              margin: EdgeInsets.only(bottom: 16.0),
              child: AppButton(
                label: 'Localizar endereço',
                action: () {
                  // adicionar funcionalidades aqui depois
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
                      fontSize: 17.0,
                      color: AppColors.appTitleColor,
                    ),
                  ),
                ],
              ),
            ),
            // Locais recentes
            Container(
              height: 130.0,
              margin: EdgeInsets.only(bottom: 16.0),
              padding: EdgeInsets.all(16.0),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12.0),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Icon(Icons.location_off, color:AppColors.buttonColor, size: 40,),
                  SizedBox(height: 8.0),
                  Text(
                    'Não há locais recentes',
                    style: TextStyle(
                      fontSize: 18.0,
                      fontWeight: FontWeight.bold,
                      color: AppColors.appTextColor,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
            // Histórico de endereços
            Container(
              margin: EdgeInsets.only(bottom: 17.0),
              child: AppButton(
                label: 'Histórico de endereços',
                action: () {
                  // adicionar funcionalidades aqui depois
                },
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        color: AppColors.bottonColor,
        shape: CircularNotchedRectangle(),
        notchMargin: 8.0,
        child: Container(height: 50.0),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        onPressed: null,
        backgroundColor: AppColors.buttonColor,
        child: Icon(Icons.fork_right, color: Colors.white, size: 40),
      ),
    );
  }
}
