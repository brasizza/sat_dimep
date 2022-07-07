import 'dart:developer';

import 'package:asuka/snackbars/asuka_snack_bar.dart';
import 'package:dimep_sat/dimep_sat.dart';
import 'package:dimep_sat/models/response_status.dart';
import 'package:flutter/material.dart';

import '../../../../core/consts.dart';
import '../../controller/acoes_controller.dart';

class AcoesSat extends StatelessWidget {
  final DimepSat _sat = DimepSat.instance;
  final AcoesController _controller;
  AcoesSat({Key? key, required AcoesController controller})
      : _controller = controller,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 10,
      children: [
        ElevatedButton(
            onPressed: () async {
              String? consulta = await _sat.consultarSat();
              if (consulta != null && consulta != '') {
                AsukaSnackbar.info(consulta).show();
              }
            },
            child: const Text("Testar sat")),
        ElevatedButton(
            onPressed: () async {
              ResponseStatus? consulta = await _sat.consultarStatusSat(codigoAtivacao: _controller.storage.getData(Consts.keyCodAtivacao));
              if (consulta != null) {
                log(consulta.toString());
                AsukaSnackbar.info(consulta.mensagem).show();
              } else {
                AsukaSnackbar.warning('Falha ao recuperar').show();
              }
            },
            child: const Text("Status sat")),
      ],
    );
  }
}
