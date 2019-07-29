import Flutter
import UIKit
import MapKit

public class SwiftFlutterMapViewPlugin: NSObject, FlutterPlatformViewFactory {
  
    var messenger: FlutterBinaryMessenger!
    
    public func create(withFrame frame: CGRect, viewIdentifier viewId: Int64, arguments args: Any?) -> FlutterPlatformView {
        return IosMapView(withFrame: frame, viewIdentifier: viewId, arguments: args, binaryMessenger: messenger)
    }
    
    @objc public init(messenger: (NSObject & FlutterBinaryMessenger)?) {
        super.init()
        self.messenger = messenger
    }
    
    public func createArgsCodec() -> FlutterMessageCodec & NSObjectProtocol {
        return FlutterStandardMessageCodec.sharedInstance()
    }
    
}

public class IosMapView: NSObject, FlutterPlatformView {
    
    fileprivate var viewId: Int64!
    fileprivate var channel: FlutterMethodChannel!
    fileprivate var messageChannel: FlutterMethodChannel!
    fileprivate var mapView: MKMapView!
    
    public func view() -> UIView {
        return self.mapView
    }
    
    public init(withFrame frame: CGRect, viewIdentifier viewId: Int64, arguments args: Any?, binaryMessenger: FlutterBinaryMessenger) {
        super.init()
        
        self.mapView = MKMapView(frame: frame)
        
        self.viewId = viewId
        self.channel = FlutterMethodChannel(name: "flutter_map_view_\(viewId)", binaryMessenger: binaryMessenger)
        
        self.channel.setMethodCallHandler({
            [weak self]
            (call: FlutterMethodCall, result: @escaping FlutterResult) -> Void in
            if let this = self {
                this.onMethodCall(call: call, result: result)
            }
        })
        
    }
    
    func onMethodCall(call: FlutterMethodCall, result: @escaping FlutterResult) {
        let method = call.method
        if method == "selectorPoint" {
//            self.mapView.setCenter(CLLocationCoordinate2D(latitude: call.arguments., longitude: <#T##CLLocationDegrees#>), animated: true)
        }
    }
    
}
