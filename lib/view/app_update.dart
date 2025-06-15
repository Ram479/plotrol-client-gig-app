import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:plotrol/globalWidgets/text_widget.dart';
import 'package:url_launcher/url_launcher.dart';

class UpdateAppPage extends StatelessWidget {
  final bool mIsForceUpdate;
  final String mCurrentVersion;
  final String mUpdateVersion;
  const UpdateAppPage({super.key, this.mIsForceUpdate = true,required this.mCurrentVersion,required this.mUpdateVersion,});
  @override

  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        SystemNavigator.pop(); // This will exit the app
        return false; // Prevent default back button action
      },
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Stack(alignment: Alignment.bottomCenter,
          children: [
            Column(children: [
              Container(
                height:
                Get.height/2.2,
                width: Get.width,
                decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(15),
                      bottomRight: Radius.circular(15),
                    ),
                ),
                child: Container(margin: const EdgeInsets.only(bottom: 50),child: Column(mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.center,children: [
                    nearleLogoImg(),
                    currentVersion()
                  ],
                 ),
                ),
              ),
              SizedBox(height: Get.height/2,
                child:Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  textContents(),
                  ],
                ),
              ),
             ],
            ),
            btnDownload(),
          ],
        ),
      ),
    );
  }
  Widget nearleLogoImg() {
    return Hero(
      tag: 'hero',
      child: Container(
        padding: const EdgeInsets.only(left: 60,right: 60,bottom: 10,top: 40),
        child: Image.asset(
         'assets/images/native_splash.png',
          height: 100,
          width: 100,
        ),
      ),
    );
  }

  Widget textContents() {
    return Column(
      children: [
        const Center(
          child:  ReusableTextWidget(
            text: 'You are using an older version of Plotrol application.',
            fontSize: 20,
            maxLines: 2,
            textAlign: TextAlign.center,
          )
        ),
        const SizedBox(height: 10,),
        Center(
            child:
            ReusableTextWidget(
              text: 'Available version',
              fontSize: 20,
            )
        ),
        const SizedBox(height: 9,),
        Center(
            child: ReusableTextWidget(
            text: mUpdateVersion,
            textAlign: TextAlign.center,
            fontSize: 18,
            fontWeight: FontWeight.bold,
            )
        )],
    );
  }

  currentVersion(){
    return Column(children: [
      const Center(
          child: ReusableTextWidget(
              text: 'Version',
              fontSize: 20,
              textAlign: TextAlign.center,
          )
      ),
      const SizedBox(height: 5,),
      Center(
        child: ReusableTextWidget(
           text: mCurrentVersion,
           textAlign: TextAlign.center,
           fontSize: 21,
           fontWeight: FontWeight.bold,
        ),
      ),
     ],
    );
  }

  Widget btnDownload() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12.0),
      child: Container(margin: const EdgeInsets.only(left: 20,right: 20),child: Row(mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
              child: ElevatedButton(
            style:  ButtonStyle(
                        backgroundColor: WidgetStateProperty.all(Colors.black),
                        foregroundColor: WidgetStateProperty.all(Colors.white),
                        shape: WidgetStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5), // Adjust radius
                          ),
                        ),
                ),
                  onPressed: () => downloadActions(),
            child: const ReusableTextWidget(
              text: 'Update',
              fontSize: 16,
            )
          ))
        ],
      ),),
    );
  }

  skipAction(){
    Get.back();
  }

  void downloadActions() async {
    var url;
    var s = Platform.isAndroid ? "Android" : "Ios";
    if(s=="Android") {
      // appInfo = await Utility.getApplicationInfo();

      url = 'https://play.google.com/console/u/0/developers/9163719228191263405/app/4974702444807509989';
    }else{
      url = 'https://apps.apple.com/us/app/nearle/id1596895375ls=1';
    }
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch App';
    }
  }

}