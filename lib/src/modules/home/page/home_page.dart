import 'package:fast_location/src/shared/colors/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';


class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  //final HomeController _controller = HomeController();
  TextEditingController searchController = TextEditingController();
  late ReactionDisposer errorReactDisposer;
  late ReactionDisposer errorRouteReactionDisposer;

  @override
  void initState() {
    super.initState();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: AppColors.appPageBackground,
      body: Text('Home Page'),
    );
  }
}
