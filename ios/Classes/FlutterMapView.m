//
//  FlutterMapView.m
//  flutter_map_view
//
//  Created by arther on 2019/7/30.
//

#import "FlutterMapView.h"
#import <MapKit/MapKit.h>

@implementation FlutterMapViewFactory {
    NSObject<FlutterBinaryMessenger>* _messenger;
}

- (instancetype)initWithMessenger:(NSObject<FlutterBinaryMessenger> *)messenger {
    self = [super init];
    if (self) {
        _messenger = messenger;
    }
    return self;
}

- (NSObject<FlutterMessageCodec>*)createArgsCodec {
    return [FlutterStandardMessageCodec sharedInstance];
}

- (nonnull NSObject<FlutterPlatformView> *)createWithFrame:(CGRect)frame viewIdentifier:(int64_t)viewId arguments:(id _Nullable)args {
    return [[FlutterMapView alloc] initWithFrame:frame viewIdentifier:viewId arguments:args binaryMessenger:_messenger];
}

@end


@implementation FlutterMapView {
    MKMapView *_mapView;
    int64_t _viewId;
    FlutterMethodChannel* _channel;
}

- (instancetype)initWithFrame:(CGRect)frame viewIdentifier:(int64_t)viewId arguments:(id)args binaryMessenger:(NSObject<FlutterBinaryMessenger> *)messenger {
    if ([super init]) {
        _viewId = viewId;
        
        _mapView = [[MKMapView alloc] initWithFrame:frame];
        
    }
    return self;
}

- (nonnull UIView *)view {
    return _mapView;
}

@end


