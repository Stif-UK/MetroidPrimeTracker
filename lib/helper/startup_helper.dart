import 'package:metroid_prime_items/model/metroid_preferences.dart';
import 'package:in_app_review/in_app_review.dart';

class StartupHelper{


  static runStartupCheck() async {
    final InAppReview inAppReview = InAppReview.instance;
    int openCount = MetroidPreferences.getOpenCount() ?? 1;
    bool hasHadReviewPrompt = MetroidPreferences.getAppReviewPrompted() ?? false;



    if(!hasHadReviewPrompt && openCount > 5){
      if (await inAppReview.isAvailable()) {
    inAppReview.requestReview();
    MetroidPreferences.setAppReviewPrompted(true);

    }

    }

  }

}