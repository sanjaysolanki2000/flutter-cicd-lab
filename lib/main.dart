import 'package:ci_cd_lab/app_config.dart';
import 'package:flutter/material.dart';
import 'package:package_info_plus/package_info_plus.dart';

class MyApp extends StatefulWidget {
  final AppConfig config;

  const MyApp({super.key, required this.config});

  @override
  State<StatefulWidget> createState() => _MyApp();
}

class _MyApp extends State<MyApp> {
  String bundleId="";

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    getAppBundleId();
  }

  Future<void> getAppBundleId() async {
    PackageInfo packageInfo = await PackageInfo.fromPlatform();

    // This fetches the iOS Bundle ID or Android Package Name
    String bundleIdentifier = packageInfo.packageName;

    print("Bundle ID / Package Name: $bundleIdentifier");

    setState(() {
      bundleId = bundleIdentifier;
    });

    // You can also get other metadata if needed:
    // String appName = packageInfo.appName;
    // String version = packageInfo.version;
    // String buildNumber = packageInfo.buildNumber;
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'My Flutter App',
      home: Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('Flutter Application'),
              SizedBox(height: 4),
              Text(widget.config.apiUrl),
              SizedBox(height: 4),
              Text(bundleId),
            ],
          ),
        ),
      ),
    );
  }
}
