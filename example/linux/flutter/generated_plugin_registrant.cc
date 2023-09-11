//
//  Generated file. Do not edit.
//

// clang-format off

#include "generated_plugin_registrant.h"

#include <networktime/networktime_plugin.h>

void fl_register_plugins(FlPluginRegistry* registry) {
  g_autoptr(FlPluginRegistrar) networktime_registrar =
      fl_plugin_registry_get_registrar_for_plugin(registry, "NetworktimePlugin");
  networktime_plugin_register_with_registrar(networktime_registrar);
}
