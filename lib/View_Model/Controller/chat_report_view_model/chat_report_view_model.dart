import 'package:ai_muspal/models/Chat_Reprt/chat_report_model.dart';
import 'package:get/get.dart';


class ChatReportViewModel extends GetxController {



  var report = ChatReportModel(
    totalScore: 93,
    pitchScore: 89,
    rhythmScore: 72,
    dynamicsScore: 56,
    overallComment: 'chatReport_overallCommentContent'.tr,
  ).obs;
}
