import 'dart:io';
import 'package:device_info_plus/device_info_plus.dart';

class DeviceInfoService {
  Future<String?> getDeviceUniqueId() async {
    final deviceInfo = DeviceInfoPlugin();

    try {
      if (Platform.isAndroid) {

        AndroidDeviceInfo androidInfo = await deviceInfo.androidInfo;
        return androidInfo.androidId; // Android ID
      }
      else if (Platform.isIOS) {

        IosDeviceInfo iosInfo = await deviceInfo.iosInfo;
        return iosInfo.identifierForVendor; // IOS unique ID
      }
      else {
        return 'Unsupported Platform';
      }
    } catch (e) {
        print('Error fetching device ID: $e');
      return null;
    }
  }
}

extension on AndroidDeviceInfo {
  Null get androidId => null;
}
