import 'dimep_sat_platform_interface.dart';
import 'models/response_status.dart';

class DimepSat {
  static DimepSat? _instance;
  // Avoid self isntance
  DimepSat._();
  static DimepSat get instance {
    _instance ??= DimepSat._();
    return _instance!;
  }

  Future<String?> getPlatformVersion() {
    return DimepSatPlatform.instance.getPlatformVersion();
  }

  Future<String?> consultarSat({int? numeroSessao}) {
    return DimepSatPlatform.instance.consultarSat(numeroSessao: numeroSessao);
  }

  Future<ResponseStatus?> consultarStatusSat({int? numeroSessao, required String codigoAtivacao}) {
    return DimepSatPlatform.instance.consultarStatusSat(numeroSessao: numeroSessao, codigoAtivacao: codigoAtivacao);
  }
}
