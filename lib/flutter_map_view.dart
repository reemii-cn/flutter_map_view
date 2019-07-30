import 'dart:async';

import 'package:flutter/services.dart';
import 'package:flutter/material.dart';

const _viewType = 'flutter_map_view';

typedef void MapViewControllerCreatedCallback(MapViewController controller);

class UIMapView extends StatefulWidget {
  final MapViewControllerCreatedCallback onActivityIndicatorWidgetCreated;
  final param;

  const UIMapView({Key key, this.onActivityIndicatorWidgetCreated, this.param})
      : super(key: key);

  @override
  _UIMapViewState createState() => _UIMapViewState();
}

class _UIMapViewState extends State<UIMapView> {
  @override
  Widget build(BuildContext context) {
    return UiKitView(
      viewType: _viewType,
      onPlatformViewCreated: _onPlatformViewCreated,
      creationParams: widget.param,
      creationParamsCodec: new StandardMessageCodec(),
    );
  }

  void _onPlatformViewCreated(int id) {
    if (widget.onActivityIndicatorWidgetCreated == null) {
      return;
    }
    widget.onActivityIndicatorWidgetCreated(new MapViewController._(id));
  }
}

class MapViewController {
  MapViewController._(int id)
      : _channel = MethodChannel('flutter_map_view_$id');

  final MethodChannel _channel;

  Future<void> userLocation() async {
    return _channel.invokeMethod('userLocation');
  }
}
