#import "FlutterMapViewPlugin.h"
#import "FlutterMapView.h"

@implementation FlutterMapViewPlugin

+ (void)registerWithRegistrar:(NSObject<FlutterPluginRegistrar> *)registrar {
    FlutterMapViewFactory *mapViewFactory = [[FlutterMapViewFactory alloc] initWithMessenger:registrar.messenger];
    [registrar registerViewFactory:mapViewFactory withId:@"flutter_map_view"];
}

@end
