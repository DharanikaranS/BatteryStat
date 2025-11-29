import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: const BatteryScreen(),
      theme: ThemeData.dark(),
    );
  }
}

class BatteryScreen extends StatefulWidget {
  const BatteryScreen({super.key});

  @override
  State<BatteryScreen> createState() => _BatteryScreenState();
}

class _BatteryScreenState extends State<BatteryScreen> {
  static const platform = MethodChannel('samples.flutter.dev/battery');

  String batteryLevel = "--%";
  String chargingStatus = "Unknown";

  Future<void> _getBatteryInfo() async {
    try {
      final int level =
          await platform.invokeMethod<int>('getBatteryLevel') ?? -1;
      final bool isCharging =
          await platform.invokeMethod<bool>('isCharging') ?? false;

      setState(() {
        batteryLevel = "$level%";
        chargingStatus = isCharging ? "Charging" : "Discharging";
      });
    } catch (e) {
      setState(() {
        batteryLevel = "Error";
        chargingStatus = "Error";
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Battery Status")),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              batteryLevel,
              style: const TextStyle(fontSize: 60, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            Text(
              chargingStatus,
              style: const TextStyle(fontSize: 40,fontStyle: FontStyle.italic),

            ),
            const SizedBox(height: 30),
            ElevatedButton(
              onPressed: _getBatteryInfo,
              child: const Text("Get Battery Level"),
            ),
          ],
        ),
      ),
    );
  }
}

