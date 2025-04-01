import 'package:device_id/device_info_screen.dart';
import 'package:flutter/material.dart';
import 'package:device_id/device_info_screen.dart';

import 'easebuzz_integrate.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Device Info Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const DeviceInfoScreen(),
      // home: easebuzz_integrate(),
    );
  }
}
