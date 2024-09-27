import 'package:cep_app/src/http/dio_config.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';


void main() {
  runApp(FastApp());
}

class FastApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'FastLocation',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final TextEditingController cepController = TextEditingController();
  String? address;
  List<String> searchHistory = []; // Histórico de endereços

  void buscarEndereco(String cep) async {
    try {
      final response = await DioConfig.dio.get('/$cep/json/');
      if (response.statusCode == 200) {
        String foundAddress =
            '${response.data['logradouro']}, ${response.data['bairro']}, ${response.data['localidade']}';
        setState(() {
          address = foundAddress;
          searchHistory.add(foundAddress); // Adiciona ao histórico
        });
      } else {
        throw Exception('Erro ao buscar endereço');
      }
    } catch (e) {
      print('Erro: $e');
      setState(() {
        address = null;
      });
    }
  }

  void abrirGoogleMaps() async {
    if (address != null) {
      final url = 'https://www.google.com/maps/search/?api=1&query=$address';
      if (await canLaunchUrl(Uri.parse(url))) {
        await launchUrl(
          Uri.parse(url),
          mode: LaunchMode.externalApplication, // Abre no app do navegador ou Google Maps
        );
      } else {
        throw 'Não foi possível lançar $url';
      }
    } else {
      print('Endereço não disponível');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: const AssetImage("lib/src/shared/images/background.jpg"),
            fit: BoxFit.cover,
            colorFilter: ColorFilter.mode(
                Colors.black.withOpacity(0.8), BlendMode.dstATop),
          ),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                'FastLocation',
                style: const TextStyle(
                  fontSize: 36,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              const SizedBox(height: 20),
              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.6),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Column(
                  children: [
                    TextField(
                      controller: cepController,
                      decoration: const InputDecoration(
                        labelText: 'Digite seu CEP',
                      ),
                    ),
                    const SizedBox(height: 20),
                    ElevatedButton(
                      onPressed: () {
                        String cep = cepController.text;
                        buscarEndereco(cep);
                      },
                      child: const Text('Buscar'),
                    ),
                    if (address != null) ...[
                      const SizedBox(height: 20),
                      Text(
                        'Endereço: $address',
                        style: const TextStyle(color: Colors.black),
                      ),
                      const SizedBox(height: 10),
                      ElevatedButton(
                        onPressed: abrirGoogleMaps,
                        child: const Text('Ver Rota no Google Maps'),
                      ),
                    ],
                    if (searchHistory.isNotEmpty) ...[
                      const SizedBox(height: 20),
                      const Text(
                        'Endereços pesquisados recentemente:',
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(height: 10),
                      for (var addr in searchHistory.reversed) // Exibe do mais recente
                        ListTile(
                          title: Text(addr),
                          onTap: () {
                            setState(() {
                              address = addr;
                            });
                          },
                        ),
                    ],
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
