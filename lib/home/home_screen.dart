import 'package:flutter/material.dart';
import 'package:it_company_name_generator/common/background.dart';
import 'package:it_company_name_generator/routes.dart';
import 'package:it_company_name_generator/model/generation_model.dart';
import 'package:provider/provider.dart';
import 'home_screen_left.dart';
import 'home_screen_right.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.startFloat,
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).pushNamed(Path.settings);
        },
        child: Icon(Icons.settings, color: Colors.white),
      ),
      body: SafeArea(
        child: ChangeNotifierProvider(
          create: (context) => GenerationModel(),
          child: Stack(
            children: [
              const Positioned.fill(
                child: const AppBackGround(),
              ),
              const Align(
                alignment: Alignment.centerLeft,
                child: const HomeScreenLeft(),
              ),
              const Align(
                alignment: Alignment.centerRight,
                child: const HomeScreenRight(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
