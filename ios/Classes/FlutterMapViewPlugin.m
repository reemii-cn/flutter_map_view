#import "FlutterMapViewPlugin.h"
#import <flutter_map_view/flutter_map_view-Swift.h>

@implementation FlutterMapViewPlugin
+ (void)registerWithRegistrar:(NSObject<FlutterPluginRegistrar>*)registrar {
    [registrar registerViewFactory: [[SwiftFlutterMapViewPlugin alloc] initWithMessenger:[registrar messenger]] withId:@"flutter_map_view"];
}
@end

