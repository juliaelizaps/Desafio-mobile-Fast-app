import 'package:fast_location/src/shared/colors/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';

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
    return const Scaffold(
      backgroundColor: AppColors.appPageBackground,
      body: Text('Home Page'),
    );
  }
}
