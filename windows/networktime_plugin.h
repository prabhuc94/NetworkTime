#ifndef FLUTTER_PLUGIN_NETWORKTIME_PLUGIN_H_
#define FLUTTER_PLUGIN_NETWORKTIME_PLUGIN_H_

#include <flutter/method_channel.h>
#include <flutter/plugin_registrar_windows.h>

#include <memory>

namespace networktime {

class NetworktimePlugin : public flutter::Plugin {
 public:
  static void RegisterWithRegistrar(flutter::PluginRegistrarWindows *registrar);

  NetworktimePlugin();

  virtual ~NetworktimePlugin();

  // Disallow copy and assign.
  NetworktimePlugin(const NetworktimePlugin&) = delete;
  NetworktimePlugin& operator=(const NetworktimePlugin&) = delete;

  // Called when a method is called on this plugin's channel from Dart.
  void HandleMethodCall(
      const flutter::MethodCall<flutter::EncodableValue> &method_call,
      std::unique_ptr<flutter::MethodResult<flutter::EncodableValue>> result);
};

}  // namespace networktime

#endif  // FLUTTER_PLUGIN_NETWORKTIME_PLUGIN_H_
