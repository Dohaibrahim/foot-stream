import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_vibrate/flutter_vibrate.dart';
import 'package:foot_stream/core/utils/constants.dart';
import 'package:foot_stream/core/utils/shared_prefrences_helper.dart';
import 'package:shared_preferences/shared_preferences.dart';

class VibrationManager {
  static const String vibrationKey = "isVibrationEnabled";

  // Get the current vibration setting
  static Future<bool> isVibrationEnabled() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getBool(vibrationKey) ?? true; // Default to true
  }

  // Enable or disable vibration
  static Future<void> setVibrationEnabled(bool isEnabled) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool(vibrationKey, isEnabled);
  }

  // Vibrate if allowed
  static Future<void> vibrate() async {
    bool isEnabled = await isVibrationEnabled();
    bool canVibrate =
        await Vibrate.canVibrate; // Check if device supports vibration

    if (isEnabled && canVibrate) {
      Vibrate.feedback(FeedbackType.medium);
      debugPrint("✅ Vibration Triggered on iOS Device");
    } else {
      debugPrint("❌ Vibration not supported or disabled in settings.");
    }
  }
}
