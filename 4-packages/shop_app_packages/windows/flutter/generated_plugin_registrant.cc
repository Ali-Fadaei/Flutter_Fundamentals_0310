//
//  Generated file. Do not edit.
//

// clang-format off

#include "generated_plugin_registrant.h"

#include <unique_device_identifier/unique_device_identifier_plugin_c_api.h>
#include <url_launcher_windows/url_launcher_windows.h>

void RegisterPlugins(flutter::PluginRegistry* registry) {
  UniqueDeviceIdentifierPluginCApiRegisterWithRegistrar(
      registry->GetRegistrarForPlugin("UniqueDeviceIdentifierPluginCApi"));
  UrlLauncherWindowsRegisterWithRegistrar(
      registry->GetRegistrarForPlugin("UrlLauncherWindows"));
}
