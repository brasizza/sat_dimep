#include "include/dimep_sat/dimep_sat_plugin_c_api.h"

#include <flutter/plugin_registrar_windows.h>

#include "dimep_sat_plugin.h"

void DimepSatPluginCApiRegisterWithRegistrar(
    FlutterDesktopPluginRegistrarRef registrar) {
  dimep_sat::DimepSatPlugin::RegisterWithRegistrar(
      flutter::PluginRegistrarManager::GetInstance()
          ->GetRegistrar<flutter::PluginRegistrarWindows>(registrar));
}
