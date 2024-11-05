import 'package:flutter/material.dart';
import 'package:package_info_plus/package_info_plus.dart';

class VersionWidget extends StatefulWidget {
  const VersionWidget({super.key});

  @override
  VersionWidgetState createState() => VersionWidgetState();
}

class VersionWidgetState extends State<VersionWidget> {
  String version = '';

  @override
  void initState() {
    super.initState();
    _initPackageInfo();
  }

  Future<void> _initPackageInfo() async {
    final info = await PackageInfo.fromPlatform();
    setState(() {
      version = '${info.version}+${info.buildNumber}';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Text(
      'v$version',
      style: TextStyle(
        color: Colors.white.withOpacity(0.5),
        fontSize: 11,
      ),
    );
  }
}
