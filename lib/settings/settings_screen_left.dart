import 'package:flutter/material.dart';
import 'package:it_company_name_generator/common/leftside_box.dart';
import 'package:it_company_name_generator/model/settings_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SettingsScreenLeft extends StatelessWidget {
  const SettingsScreenLeft({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LeftSideBox(
      child: BlocBuilder<SettingsModel, SettingsModelState>(
        builder: (context, state) => ListView.builder(
          itemBuilder: (context, index) => Row(
            children: [
              // Remove
              IconButton(
                onPressed: () => BlocProvider.of<SettingsModel>(context).add(
                  RemoveByIndexSettingsEvent(index),
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
    );
  }
}
