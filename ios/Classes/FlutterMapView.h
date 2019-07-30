//
//  FlutterMapView.h
//  flutter_map_view
//
//  Created by arther on 2019/7/30.
//

#import <Flutter/Flutter.h>

NS_ASSUME_NONNULL_BEGIN

@interface FlutterMapView : NSObject<FlutterPlatformView>

- (instancetype)initWithFrame:(CGRect)frame
               viewIdentifier:(int64_t)viewId
                    arguments:(id _Nullable)args
              binaryMessenger:(NSObject<FlutterBinaryMessenger>*)messenger;

- (UIView*)view;

@end

@interface FlutterMapViewFactory : NSObject<FlutterPlatformViewFactory>

- (instancetype)initWithMessenger:(NSObject<FlutterBinaryMessenger>*)messenger;

@end

NS_ASSUME_NONNULL_END
