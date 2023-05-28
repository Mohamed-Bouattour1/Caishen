import 'dart:io';

import 'package:device_info_plus/device_info_plus.dart';



  DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();

  //AndroidDeviceInfo? androidInfo;
  Future<dynamic> getInfo() async {
    if (Platform.isAndroid) {
       return await deviceInfo.androidInfo;
    } else if (Platform.isIOS) {
      return await deviceInfo.iosInfo;
    }else {
      return await deviceInfo.webBrowserInfo;
    }
  
   
  }

