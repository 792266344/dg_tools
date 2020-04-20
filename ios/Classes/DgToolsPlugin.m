#import "DgToolsPlugin.h"
#if __has_include(<dg_tools/dg_tools-Swift.h>)
#import <dg_tools/dg_tools-Swift.h>
#else
// Support project import fallback if the generated compatibility header
// is not copied when this plugin is created as a library.
// https://forums.swift.org/t/swift-static-libraries-dont-copy-generated-objective-c-header/19816
#import "dg_tools-Swift.h"
#endif

@implementation DgToolsPlugin
+ (void)registerWithRegistrar:(NSObject<FlutterPluginRegistrar>*)registrar {
  [SwiftDgToolsPlugin registerWithRegistrar:registrar];
}
@end
