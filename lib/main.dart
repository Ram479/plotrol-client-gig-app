// import 'package:device_info_plus/device_info_plus.dart';
// import 'package:device_info_plus/device_info_plus.dart';
// import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:plotrol/view/intro_screen.dart';
import 'package:plotrol/view/main_screen.dart';
import 'package:plotrol/view/singup_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sizer/sizer.dart';

import 'helper/api_constants.dart';

Future<void> main() async {
  ApiConstants.login = ApiConstants.loginDev;
  // await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return Sizer(builder: (context, orientation, screenType) {
      return GetMaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.black),
          useMaterial3: true,
        ),
        home: MyHomePage(), //Add Home Screen here if user is already logged in
        debugShowCheckedModeBanner: false,
      );
    });
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String? uniqueDeviceId;
  String? deviceId;
  String? accessToken;
  var iosDeviceInfo;
  var androidDeviceInfo;

  @override
  void initState() {
    getUserDetails();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return (accessToken == null)
        ? OnBoardPage()
        : HomeView(
          selectedIndex: 0,
        );
  }

  getUserDetails() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    accessToken = prefs.getString('access_token');
  }
}
