import 'package:flutter/material.dart';
import 'package:pathlexi/screens/list.dart';
import 'package:pathlexi/style.dart';
import 'package:pathlexi/screens/search.dart';
import 'package:pathlexi/screens/about.dart';
import 'package:pathlexi/screens/feedback.dart';

import 'dart:async';

import 'package:flutter/services.dart';
import 'package:advanced_in_app_review/advanced_in_app_review.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);
  @override
  HomeScreenState createState() => HomeScreenState();
}

class HomeScreenState extends State<HomeScreen> {
  int selectedIndex = 0;
  final widgetOptions = [
    const ListScreen(),
    const SearchScreen(),
    const AboutScreen(),
    const FeedbackScreen(),
  ];

  String _platformVersion = 'Unknown';

  @override
  void initState() {
    super.initState();
    initPlatformState();
    AdvancedInAppReview()
        .setMinDaysBeforeRemind(180)
        .setMinDaysAfterInstall(7)
        .setMinLaunchTimes(5)
        .monitor();
  }

  // Platform messages are asynchronous, so we initialize in an async method.
  Future<void> initPlatformState() async {
    String platformVersion;
    // Platform messages may fail, so we use a try/catch PlatformException.
    // We also handle the message potentially returning null.
    try {
      platformVersion = await AdvancedInAppReview.platformVersion ??
          'Unknown platform version';
    } on PlatformException {
      platformVersion = 'Failed to get platform version.';
    }

    // If the widget was removed from the tree while the asynchronous platform
    // message was in flight, we want to discard the reply rather than calling
    // setState to update our non-existent appearance.
    if (!mounted) return;

    setState(() {
      _platformVersion = platformVersion;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: widgetOptions.elementAt(selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        unselectedItemColor: Style.closedButtonUnpressed,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.search), label: 'Search'),
          BottomNavigationBarItem(
              icon: Icon(Icons.important_devices), label: 'About'),
          BottomNavigationBarItem(icon: Icon(Icons.message), label: 'Feedback'),
        ],
        currentIndex: selectedIndex,
        fixedColor: Style.plcGreenTheme,
        onTap: onItemTapped,
      ),
    );
  }

  void onItemTapped(int index) {
    setState(() {
      selectedIndex = index;
    });
  }
}
