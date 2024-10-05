import 'package:fast_location/src/shared/colors/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import '../../../shared/components/app_button.dart';
import '../controller/home_controller.dart';
import '../model/address_model.dart'; // Certifique-se de importar o AddressModel

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final HomeController _controller = HomeController();
  TextEditingController searchController = TextEditingController();
  late ReactionDisposer errorReactDisposer;
  late ReactionDisposer errorRouteReactionDisposer; // Corrigido aqui

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
    errorRouteReactionDisposer(); // Este também deve ser removido se não for utilizado
  }

  // Função para mostrar o diálogo de entrada do CEP
  Future<void> _showCepDialog(BuildContext context) async {
    final TextEditingController _cepController = TextEditingController();

    return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Insira o CEP'),
          content: TextField(
            controller: _cepController,
            keyboardType: TextInputType.number,
            decoration: const InputDecoration(hintText: 'Digite o CEP'),
          ),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('Cancelar'),
            ),
            TextButton(
              onPressed: () async {
                // Chama a função de busca de endereço
                await _controller.buscarEndereco(_cepController.text);
                Navigator.of(context).pop();
                // Aqui você pode adicionar lógica para exibir o endereço na tela, se necessário
                if (_controller.address != null) {
                  // Exibir endereço encontrado, você pode personalizar isso como quiser
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text('Endereço: ${_controller.address}')),
                  );
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Endereço não encontrado!')),
                  );
                }
              },
              child: const Text('Buscar'),
            ),
          ],
        );
      },
    );
  }

  // Função para mostrar o histórico de endereços
  Future<void> _showAddressHistoryDialog(BuildContext context) async {
    List<AddressModel> addressHistory = await _controller.getAddressHistoryList(); // Certifique-se de que esta função existe

    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Histórico de Endereços'),
          content: SizedBox(
            width: double.maxFinite,
            child: ListView.builder(
              itemCount: addressHistory.length,
              itemBuilder: (context, index) {
                final address = addressHistory[index];
                return ListTile(
                  title: Text('${address.publicPlace}, ${address.city} - ${address.state}'),
                  subtitle: Text('CEP: ${address.cep}'),
                );
              },
            ),
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: const Text('Fechar'),
            ),
          ],
        );
      },
    );
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
                      color: AppColors.buttonColor
                  ),
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
                  _showCepDialog(context); // Chama o método para exibir o diálogo
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
                  Icon(Icons.location_off, color: AppColors.buttonColor, size: 40,),
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
                  _showAddressHistoryDialog(context); // Chama a função para mostrar o histórico
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
