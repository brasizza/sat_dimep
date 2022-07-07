#import "DimepSatPlugin.h"
#if __has_include(<dimep_sat/dimep_sat-Swift.h>)
#import <dimep_sat/dimep_sat-Swift.h>
#else
// Support project import fallback if the generated compatibility header
// is not copied when this plugin is created as a library.
// https://forums.swift.org/t/swift-static-libraries-dont-copy-generated-objective-c-header/19816
#import "dimep_sat-Swift.h"
#endif

@implementation DimepSatPlugin
+ (void)registerWithRegistrar:(NSObject<FlutterPluginRegistrar>*)registrar {
  [SwiftDimepSatPlugin registerWithRegistrar:registrar];
}
@end
