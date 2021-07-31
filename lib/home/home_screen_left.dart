import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:it_company_name_generator/common/leftside_box.dart';
import 'package:it_company_name_generator/model/generation_model.dart';
import 'package:provider/provider.dart';

class HomeScreenLeft extends StatelessWidget {
  const HomeScreenLeft({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LeftSideBox(
      child: Consumer<GenerationModel>(
        builder: (_, genModel, __) {
          if (genModel.names.isNotEmpty)
            return ListView.builder(
              itemBuilder: (context, index) => Row(
                children: [
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Text(genModel.names[index]),
                  ),
                ],
              ),
              //
              itemCount: genModel.names.length,
              padding: const EdgeInsets.symmetric(
                horizontal: 32.0,
                vertical: 32.0,
              ),
            );
          return const SpinKitSquareCircle(
            color: Colors.orange,
            size: 64.0,
          );
        },
      ),
    );
  }
}
