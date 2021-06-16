import 'dart:io';

import 'package:device_info/device_info.dart';
import 'package:flutter/services.dart';

Future<Map<String, dynamic>> getDeviceInfo() async {
  final DeviceInfoPlugin deviceInfoPlugin = DeviceInfoPlugin();

  Map<String, dynamic> deviceData = <String, dynamic>{};

  String nameDevice = "device";

  try {
    if (Platform.isAndroid) {
      //AndroidDeviceInfo androidInfo = await deviceInfoPlugin.androidInfo;
      deviceData = _getInfoDataAndroid(await deviceInfoPlugin.androidInfo);
    }

    if (Platform.isIOS) {
      //IosDeviceInfo iosInfo = await deviceInfoPlugin.iosInfo;
      deviceData = _getInfoDataIOS(await deviceInfoPlugin.iosInfo);
    }
  } on PlatformException {
    print("Print erro device");
  }
  return deviceData;
}

Map<String, dynamic> _getInfoDataAndroid(AndroidDeviceInfo build) {
  return <String, dynamic>{
    'device': build.device,
    'manufacturer': build.manufacturer,
  };
}

Map<String, dynamic> _getInfoDataIOS(IosDeviceInfo build) {
  return <String, dynamic>{
    'name': build.name,
    'model': build.model,
  };
}
