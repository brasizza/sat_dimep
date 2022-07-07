import 'package:asuka/asuka.dart' as asuka;
import 'package:dimep_sat_example/app/core/local_storage/local_storage_impl.dart';
import 'package:dimep_sat_example/app/modules/home/controller/home_controller.dart';
import 'package:dimep_sat_example/app/modules/home/home_view.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final storage = LocalSharedPrefs.instance;
  await storage.init();
  runApp(MaterialApp(
    builder: asuka.builder,
    navigatorObservers: [
      asuka.asukaHeroController //if u don`t add this Hero will not work
    ],
    home: HomeView(
      controller: HomeController.instance(
        storage: storage,
      ),
    ),
  ));
}
