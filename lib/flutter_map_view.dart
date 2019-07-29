import 'dart:async';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

const _viewType = 'flutter_map_view';

typedef void PdfVieControllerwWidgetCreatedCallback(
    MapViewController controller);

class UIMapWidget extends StatefulWidget {

  final PdfVieControllerwWidgetCreatedCallback onActivityIndicatorWidgetCreated;
  // pdf路径参数
  final param;
  final CallFlutterLocal callFlutterLocal;

  const UIMapWidget(
      {Key key,
        this.onActivityIndicatorWidgetCreated,
        this.param,
        this.callFlutterLocal})
      : super(key: key);

  @override
  _UIMapWidgetState createState() => _UIMapWidgetState();
}

class _UIMapWidgetState extends State<UIMapWidget> {
  @override
  Widget build(BuildContext context) {
    return UiKitView(
      viewType: _viewType,
      onPlatformViewCreated: _onPlatformViewCreated,
      creationParamsCodec: new StandardMessageCodec(),
      creationParams: widget.param,
    );;
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

  Future<void> edit() async {
    return _channel.invokeMethod('edit');
  }

  Future<void> changeLineSize(int lineWidth) async {
    return _channel.invokeMethod('changeLineSize', lineWidth);
  }

  Future<void> changeLineColor(String lineColor) async {
    return _channel.invokeMethod('changeLineColor', lineColor);
  }
}

class CallFlutterLocal {
  final FutureOr<void> Function(List<dynamic>) getLinePath;
  final FutureOr<List<Map<String, dynamic>>> Function(int pageNum)
  getCurrentPage;
  final FutureOr<void> Function(int totalCount) getTotalCount;

  CallFlutterLocal(
      {@required this.getLinePath,
        @required this.getCurrentPage,
        @required this.getTotalCount});
}
