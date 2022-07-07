import 'package:plugin_platform_interface/plugin_platform_interface.dart';

import 'dimep_sat_method_channel.dart';
import 'models/response_status.dart';

abstract class DimepSatPlatform extends PlatformInterface {
  /// Constructs a DimepSatPlatform.
  DimepSatPlatform() : super(token: _token);

  static final Object _token = Object();

  static DimepSatPlatform _instance = MethodChannelDimepSat();

  /// The default instance of [DimepSatPlatform] to use.
  ///
  /// Defaults to [MethodChannelDimepSat].
  static DimepSatPlatform get instance => _instance;

  /// Platform-specific implementations should set this with their own
  /// platform-specific class that extends [DimepSatPlatform] when
  /// they register themselves.
  static set instance(DimepSatPlatform instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  Future<String?> getPlatformVersion() {
    throw UnimplementedError('platformVersion() has not been implemented.');
  }

  Future<String?> consultarSat({int? numeroSessao}) {
    throw UnimplementedError('platformVersion() has not been implemented.');
  }

  Future<ResponseStatus?> consultarStatusSat({int? numeroSessao, required codigoAtivacao}) {
    throw UnimplementedError('platformVersion() has not been implemented.');
  }
}
