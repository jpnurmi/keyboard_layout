import 'dart:async';
import 'dart:io';

import 'package:keyboard_info/src/keyboard_info.dart';
import 'package:keyboard_info/src/keyboard_info_linux.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';
import 'package:keyboard_info/src/keyboard_info_method_channel.dart';

// ignore_for_file: public_member_api_docs

abstract class KeyboardInfoPlatformInterface extends PlatformInterface {
  KeyboardInfoPlatformInterface() : super(token: _token);

  static final Object _token = Object();
  static KeyboardInfoPlatformInterface? _instance;

  static KeyboardInfoPlatformInterface get instance {
    if (_instance == null) {
      if (Platform.isLinux) _instance = KeyboardInfoLinux();
      _instance ??= KeyboardInfoMethodChannel();
    }
    return _instance!;
  }

  static set instance(KeyboardInfoPlatformInterface instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  Future<KeyboardInfo> getKeyboardInfo() {
    throw UnimplementedError('getKeyboardInfo() has not been implemented.');
  }
}
