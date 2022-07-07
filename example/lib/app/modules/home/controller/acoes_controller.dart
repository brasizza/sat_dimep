import 'package:dimep_sat_example/app/core/local_storage/local_storage.dart';

class AcoesController {
  static AcoesController? _instance;
  late final LocalStorage storage;
  // Avoid self isntance
  AcoesController._({required LocalStorage localStorage}) {
    storage = localStorage;
  }
  factory AcoesController.instance({required LocalStorage localStorage}) {
    _instance ??= AcoesController._(localStorage: localStorage);
    return _instance!;
  }
}
