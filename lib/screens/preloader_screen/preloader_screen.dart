import 'package:flutter/material.dart';
import 'package:affirmation_utility/components/app_loading.dart';
import 'package:affirmation_utility/screens/main_screen/main_screen.dart';

class PreloaderScreen extends StatefulWidget {
  const PreloaderScreen({super.key});

  @override
  State<PreloaderScreen> createState() => _PreloaderScreenState();
}

class _PreloaderScreenState extends State<PreloaderScreen> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      Future.delayed(Durations.medium1, () {
        Navigator.of(context).pushReplacement(
            MaterialPageRoute(builder: (context) => const MainScreen()));
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
        body: Center(
      child: Column(
        children: [
          Spacer(
            flex: 5,
          ),
          LoadingWidget(),
          Spacer(
            flex: 1,
          ),
        ],
      ),
    ));
  }
}
