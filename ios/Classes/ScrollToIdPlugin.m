#import "ScrollToIdPlugin.h"
#if __has_include(<scroll_to_id/scroll_to_id-Swift.h>)
#import <scroll_to_id/scroll_to_id-Swift.h>
#else
// Support project import fallback if the generated compatibility header
// is not copied when this plugin is created as a library.
// https://forums.swift.org/t/swift-static-libraries-dont-copy-generated-objective-c-header/19816
#import "scroll_to_id-Swift.h"
#endif

@implementation ScrollToIdPlugin
+ (void)registerWithRegistrar:(NSObject<FlutterPluginRegistrar>*)registrar {
  [SwiftScrollToIdPlugin registerWithRegistrar:registrar];
}
@end
