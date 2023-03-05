import 'package:flutter/cupertino.dart';
import 'package:metroid_prime_items/copy/aboutapp_copy.dart';
import 'package:metroid_prime_items/model/metroid_preferences.dart';
import 'package:in_app_review/in_app_review.dart';
import 'package:package_info_plus/package_info_plus.dart';

class StartupHelper{


  static runStartupCheck(BuildContext context) async {
    bool showWhatsNew = await returnWhatsNew();
    final InAppReview inAppReview = InAppReview.instance;
    int openCount = MetroidPreferences.getOpenCount() ?? 1;
    bool hasHadReviewPrompt = MetroidPreferences.getAppReviewPrompted() ?? false;

    //If the build version has updated, show whats new dialog
    if(showWhatsNew){
      AboutAppCopy.getWhatsNewDialog(context);
      StartupHelper.updateLatestVersion();
    }


    //check if a review prompt should be shown, only if no what's new dialog is shown
    if(!showWhatsNew && !hasHadReviewPrompt && openCount > 5){
      if (await inAppReview.isAvailable()) {
    inAppReview.requestReview();
    MetroidPreferences.setAppReviewPrompted(true);

    }

    }

  }

  static Future<bool> returnWhatsNew() async {
    PackageInfo packageInfo = await PackageInfo.fromPlatform();
    String currentVersion = packageInfo.version.toString();
    String? latestAppVersion = MetroidPreferences.getLatestVersion();
    return latestAppVersion == null? true : _isVersionGreaterThan(currentVersion, latestAppVersion);

  }

  static bool _isVersionGreaterThan(String currentVersion, String latestAppVersion){
    List<String> lastV = latestAppVersion.split(".");
    List<String> newV = currentVersion.split(".");
    bool a = false;
    for (var i = 0 ; i <= 2; i++){
      a = int.parse(newV[i]) > int.parse(lastV[i]);
      if(int.parse(newV[i]) != int.parse(lastV[i])) break;
    }
    return a;
  }

  static updateLatestVersion() async {
    PackageInfo packageInfo = await PackageInfo.fromPlatform();
    String currentVersion = packageInfo.version.toString();
    MetroidPreferences.setLatestVersion(currentVersion);

  }


}