import 'package:mobx/mobx.dart';
import 'package:url_launcher/url_launcher_string.dart';

part 'feedback.g.dart';

class FeedbackStore = _FeedbackStore with _$FeedbackStore;

abstract class _FeedbackStore with Store { 

/**********************************************************************************/
///OBSERVER
/**********************************************************************************/
///ACTIONS
/**********************************************************************************/
///HELPER METHODS
 
  Future<void> launchURL() async {
    launchUrlString("https://docs.google.com/forms/d/e/1FAIpQLSdXofUfraxxnjRJkmsAgN-wzygoDe0EU72GtgnWt6eoJlBHHg/viewform?usp=sf_link");
    throw "error";
  }
}