import 'package:esentispws/pages/page_builder.dart';
import 'package:flutter/material.dart';

class DeviceInfo extends InheritedWidget {
  const DeviceInfo({
    super.key,
    required this.type,
    required super.child,
  });

  final DeviceType type;

  static DeviceInfo? maybeOf(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<DeviceInfo>();
  }

  static DeviceInfo of(BuildContext context) {
    final DeviceInfo? result = maybeOf(context);
    assert(result != null, 'No Device Type found in this context');
    return result!;
  }

  @override
  bool updateShouldNotify(DeviceInfo oldWidget) => type != oldWidget.type;
}
