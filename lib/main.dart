import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart' show BlocProvider;
import 'package:hydrated_bloc/hydrated_bloc.dart'
    show HydratedBloc, HydratedStorage;
import 'package:path_provider/path_provider.dart';
import 'package:it_company_name_generator/model/settings_model.dart';
import 'package:it_company_name_generator/common/text.dart';
import 'routes.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  HydratedBloc.storage = await HydratedStorage.build(
    storageDirectory: await getApplicationDocumentsDirectory(),
  );

  runApp(const IamRoot());
}

class IamRoot extends StatelessWidget {
  const IamRoot({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => SettingsModel(),
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        title: AppText.title,
        home: const SettingsScreen(),
      ),
    );
  }
}
