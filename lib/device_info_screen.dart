import 'package:flutter/material.dart';
import 'package:device_id/device_info_service.dart';

class DeviceInfoScreen extends StatefulWidget {
  const DeviceInfoScreen({super.key});

  @override
  State<DeviceInfoScreen> createState() => _DeviceInfoScreenState();
}

class _DeviceInfoScreenState extends State<DeviceInfoScreen> {
  String? deviceUniqueId;

  @override
  void initState() {
    super.initState();
    fetchDeviceId();
  }

  Future<void> fetchDeviceId() async {
    String? uniqueId = await DeviceInfoService().getDeviceUniqueId();
    setState(() {
      deviceUniqueId = uniqueId;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Device Unique ID'),
      ),
      body: Center(
        child: deviceUniqueId == null
            ? const CircularProgressIndicator()
            : Text(
          'Device Unique ID: $deviceUniqueId',
          style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
