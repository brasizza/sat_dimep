import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

import 'dimep_sat_platform_interface.dart';
import 'models/response_status.dart';

/// An implementation of [DimepSatPlatform] that uses method channels.
class MethodChannelDimepSat extends DimepSatPlatform {
  /// The method channel used to interact with the native platform.
  @visibleForTesting
  final methodChannel = const MethodChannel('dimep_sat');

  @override
  Future<String?> getPlatformVersion() async {
    final version = await methodChannel.invokeMethod<String>('getPlatformVersion');
    return version;
  }

  @override
  Future<String?> consultarSat({int? numeroSessao}) async {
    final consultaSat = await methodChannel.invokeMethod<String>('consultarSat', {'numeroSessao': numeroSessao});
    return consultaSat;
  }

  @override
  Future<ResponseStatus?> consultarStatusSat({int? numeroSessao, required codigoAtivacao}) async {
    final consultaSat = await methodChannel.invokeMethod<String>('consultarStatus', {'numeroSessao': numeroSessao, 'codigoAtivacao': codigoAtivacao});
    if (consultaSat != null) {
      List<String?> consulta = consultaSat.split('|');

      final response = ResponseStatus(
        numeroSessao: consulta[0] ?? '',
        codStatus: consulta[1] ?? '',
        mensagem: consulta[2] ?? '',
        cod: consulta[3] ?? '',
        mensagemSefaz: consulta[4] ?? '',
        nserieSat: consulta[5] ?? '',
        tipoLan: consulta[6] ?? '',
        lanIp: consulta[7] ?? '',
        lanMac: consulta[8] ?? '',
        lanGateway: consulta[9] ?? '',
        lanDns: consulta[10] ?? '',
        lanDns2: consulta[11] ?? '',
        statusLan: consulta[12] ?? '',
        nivelBateria: consulta[13] ?? '',
        memoriaTotal: consulta[14] ?? '',
        memoriaUsada: consulta[15] ?? '',
        dataAtual: consulta[16] ?? '',
        versaoSoftwareSat: consulta[17] ?? '',
        versaoLayout: consulta[18] ?? '',
        ultimoCfe: consulta[19] ?? '',
        numeroInicial: consulta[20] ?? '',
        numeroFinal: consulta[21] ?? '',
        dataUltimaCfe: consulta[22] ?? '',
        dataComunicacaoSefaz: consulta[23] ?? '',
        dataEmissaoCertificado: consulta[24] ?? '',
        dataVencimentoCertificado: consulta[25] ?? '',
        estadoSat: consulta[26] ?? '',
      );
      return response;
    } else {
      return null;
    }
  }
}
