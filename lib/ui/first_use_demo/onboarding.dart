import 'dart:io';

import 'package:metroid_prime_items/model/metroid_preferences.dart';
import 'package:metroid_prime_items/ui/initialise_screen.dart';
import 'package:metroid_prime_items/ui/MetroidHome.dart';
import 'package:app_tracking_transparency/app_tracking_transparency.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class MetroidOnboarding extends StatefulWidget {
  const MetroidOnboarding({Key? key}) : super(key: key);

  @override
  State<MetroidOnboarding> createState() => _MetroidOnboardingState();
}

class _MetroidOnboardingState extends State<MetroidOnboarding> {
  final pageViewController = PageController();
  bool isLastPage = false;

  @override
  void dispose() {
    pageViewController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    //If platform is iOS, request tracking permission for ads
    checkATT();



    return Scaffold(
      body: Container(
        padding: const EdgeInsets.only(bottom: 80),
        child: PageView(
          controller: pageViewController,
          onPageChanged: (index){
            setState(()=> isLastPage = index == 3);
          },
          children: [
            buildPage(
                colour: Theme.of(context).canvasColor,
                urlImage: 'assets/demo/page1_logo.png',
                title: "MP Checklist",
                subtitle: "Track your way to 100%!\nSwipe to learn what MP Checklist can do..."),
            buildPage(
                colour: Theme.of(context).canvasColor,
                urlImage: Get.isDarkMode? 'assets/demo/calculator_dark.png':'assets/demo/calculator_light.png',
                title: "Regions",
                subtitle: "Track progression through the regions of Tallon IV"),
            buildPage(
                colour: Theme.of(context).canvasColor,
                urlImage: Get.isDarkMode? 'assets/demo/notes_dark.png': 'assets/demo/notes_light.png',
                title: "Item Types",
                subtitle: "...or track by collectable type \n"),
            buildPage(
                colour: Theme.of(context).canvasColor,
                urlImage: Get.isDarkMode? 'assets/demo/temperature_dark.png':'assets/demo/temperature_light.png',
                title: "Search by Room",
                subtitle: "Found an item?\nQuickly search the in-game room name to log it!"),
          ],
        ),
      ),
      bottomSheet:  isLastPage? Padding(
        padding: const EdgeInsets.all(20.0),
        child: TextButton(
          style: TextButton.styleFrom(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20.0)
            ),
            foregroundColor: Colors.white,
            backgroundColor: getMPColour(),
            minimumSize: const Size.fromHeight(80),
          ),
          child: const Text("Let's go!",
            style: TextStyle(fontSize: 22),),
          onPressed: () async {
            await MetroidPreferences.setHasSeenDemo(true);
            Get.off(()=> const InitialiseScreen(targetWidget: MetroidHome()));
          },
        ),
      ) :Container(
        padding: const EdgeInsets.all(10.0),
        height: 80,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            TextButton(
              child: const Text("SKIP"),
              onPressed: (){
                pageViewController.jumpToPage(3);
              },),
            Center(
              child: SmoothPageIndicator(
                  controller: pageViewController,
                  effect: SlideEffect(
                    type: SlideType.slideUnder,
                    dotColor: Get.isDarkMode? Colors.white24: Colors.black26,
                    activeDotColor: getMPColour(),
                  ),
                  onDotClicked: (index) => pageViewController.animateToPage(
                      index,
                      duration: const Duration(milliseconds: 500),
                      curve: Curves.easeIn),
                  count: 4),
            ),
            TextButton(
              child: const Text("NEXT"),
              onPressed: (){
                pageViewController.nextPage(
                    duration: const Duration(microseconds: 500),
                    curve: Curves.easeInOut);
              },),
          ],
        ),
      ),
    );
  }
  Widget buildPage({
    required Color colour,
    required String urlImage,
    required String title,
    required String subtitle
  }) => Container(
    color: colour,
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset(
          urlImage,
          fit: BoxFit.cover,
          width: double.infinity,
        ),
        const SizedBox(height: 32,),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12.0),
          child: Text(
            title,
            textAlign: TextAlign.center,
            style: TextStyle(
                color: getMPColour(),
                fontSize: 32,
                fontWeight: FontWeight.bold
            ),
          ),
        ),
        const SizedBox(height: 24,),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 12.0),
          child: Text(
              subtitle,
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.bodyLarge
          ),
        )
      ],
    ),
  );

  Color getMPColour(){
    return Colors.deepOrange;
  }

  Future<int> checkATT() async {
    if(Platform.isIOS) {
      while(WidgetsBinding.instance.lifecycleState != AppLifecycleState.resumed){
        Future.delayed(const Duration(milliseconds: 400));
      }
      if(await AppTrackingTransparency.trackingAuthorizationStatus == TrackingStatus.notDetermined){
        AppTrackingTransparency.requestTrackingAuthorization();
        await Future.delayed(const Duration(milliseconds: 4000));
      }

    }
    return 1;
  }
}
