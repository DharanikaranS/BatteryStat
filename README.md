# 📱 Battery Status App (Flutter + Kotlin)

A simple Flutter application that reads **battery percentage** and **charging status** from **native Android (Kotlin)** without using any third-party plugins.  
Communication between Flutter and Android is done using **MethodChannels**.

---

##  Features

-  Get Battery Level (0–100%)
-  Detect Charging or Discharging status
-  Uses Android's native **BatteryManager** API
-  Flutter ↔ Kotlin communication using **MethodChannel**
-  No third-party plugins (battery_plus not used)

---

## 📁 Project Structure
```bash
project/
├── lib/
│   └── main.dart
│
└── android/
    └── app/
        └── src/
            └── main/
                └── kotlin/
                    └── com/
                        └── example/
                            └── batterystat/
                                └── MainActivity.kt

```
How to Run?

Connect your Android device → enable USB Debugging
```bash
flutter clean
flutter pub get
flutter run




