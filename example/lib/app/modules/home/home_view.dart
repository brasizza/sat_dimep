import 'package:dimep_sat_example/app/core/consts.dart';
import 'package:dimep_sat_example/app/modules/home/controller/acoes_controller.dart';
import 'package:dimep_sat_example/app/modules/home/controller/config_controller.dart';
import 'package:dimep_sat_example/app/modules/home/controller/home_controller.dart';
import 'package:dimep_sat_example/app/modules/home/view/components/acoes_sat.dart';
import 'package:dimep_sat_example/app/modules/home/view/components/config_sat.dart';
import 'package:flutter/material.dart';

class HomeView extends StatefulWidget {
  final HomeController controller;
  const HomeView({Key? key, required this.controller}) : super(key: key);

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('SAT DIMEP!'),
        centerTitle: true,
        leading: InkWell(
          onTap: () async {
            await showModalBottomSheet(
                context: context,
                backgroundColor: Colors.transparent,
                builder: (_) {
                  return ConfigSat(
                    controller: ConfigController.instance(storage: widget.controller.storage),
                  );
                });
            setState(() {});
          },
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              Icon(Icons.settings),
              Text("Configs"),
            ],
          ),
        ),
      ),
      body: Visibility(
        visible: widget.controller.storage.hasData(Consts.keyCodAtivacao),
        replacement: const Center(child: Text("Faça a configuração do seu sat.\nClique na engrenagem!")),
        child: AcoesSat(controller: AcoesController.instance(localStorage: widget.controller.storage)),
      ),
    );
  }
}
