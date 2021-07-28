import 'package:flutter/material.dart';
import 'package:it_company_name_generator/common/background.dart';
import 'package:it_company_name_generator/common/leftside_box.dart';
import 'package:it_company_name_generator/model/settings_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            Positioned.fill(
              child: const AppBackGround(),
            ),
            Align(
              alignment: Alignment.centerLeft,
              child: LeftSideBox(
                child: BlocBuilder<SettingsModel, SettingsModelState>(
                  builder: (context, state) => ListView.builder(
                    itemBuilder: (context, index) => Row(
                      children: [
                        // Remove
                        IconButton(
                          onPressed: () =>
                              BlocProvider.of<SettingsModel>(context).add(
                            NewSettingsEvent(
                              state..removeAt(index),
                            ),
                          ),
                          icon: Icon(Icons.delete),
                        ),
                        const SizedBox(
                          width: 16.0,
                        ),
                        // Item
                        SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Text(state[index]),
                        ),
                      ],
                    ),
                    //
                    itemCount: state.length,
                    padding: const EdgeInsets.symmetric(
                      horizontal: 16.0,
                      vertical: 32.0,
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
