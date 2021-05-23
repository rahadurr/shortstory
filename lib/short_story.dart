import 'package:flutter/material.dart';
import 'package:shortstory/env_config.dart';

import 'screens/home_screen.dart';

class ShortStory extends StatefulWidget {
  @override
  _ShortStoryState createState() => _ShortStoryState();
}

class _ShortStoryState extends State<ShortStory> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: EnvConfig.APP_TITLE,
      home: HomeScreen(),
    );
  }
}
