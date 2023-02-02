import 'package:flutter/services.dart';

const _channel = MethodChannel("flutter_launcher_plus");

Future<void> customUrlLauncher(String websiteUrl) async {
  await _channel
      .invokeMethod('launchUrl', <String, String>{'website_url': websiteUrl});
}
