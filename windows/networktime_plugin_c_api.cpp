#include "include/networktime/networktime_plugin_c_api.h"

#include <flutter/plugin_registrar_windows.h>

#include "networktime_plugin.h"

void NetworktimePluginCApiRegisterWithRegistrar(
    FlutterDesktopPluginRegistrarRef registrar) {
  networktime::NetworktimePlugin::RegisterWithRegistrar(
      flutter::PluginRegistrarManager::GetInstance()
          ->GetRegistrar<flutter::PluginRegistrarWindows>(registrar));
}
