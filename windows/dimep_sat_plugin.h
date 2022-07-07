#ifndef FLUTTER_PLUGIN_DIMEP_SAT_PLUGIN_H_
#define FLUTTER_PLUGIN_DIMEP_SAT_PLUGIN_H_

#include <flutter/method_channel.h>
#include <flutter/plugin_registrar_windows.h>

#include <memory>

namespace dimep_sat {

class DimepSatPlugin : public flutter::Plugin {
 public:
  static void RegisterWithRegistrar(flutter::PluginRegistrarWindows *registrar);

  DimepSatPlugin();

  virtual ~DimepSatPlugin();

  // Disallow copy and assign.
  DimepSatPlugin(const DimepSatPlugin&) = delete;
  DimepSatPlugin& operator=(const DimepSatPlugin&) = delete;

 private:
  // Called when a method is called on this plugin's channel from Dart.
  void HandleMethodCall(
      const flutter::MethodCall<flutter::EncodableValue> &method_call,
      std::unique_ptr<flutter::MethodResult<flutter::EncodableValue>> result);
};

}  // namespace dimep_sat

#endif  // FLUTTER_PLUGIN_DIMEP_SAT_PLUGIN_H_
