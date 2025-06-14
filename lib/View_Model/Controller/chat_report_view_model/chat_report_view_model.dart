import 'package:ai_muspal/models/Chat_Reprt/chat_report_model.dart';
import 'package:get/get.dart';


class ChatReportViewModel extends GetxController {
  var report = ChatReportModel(
    totalScore: 93,
    pitchScore: 89,
    rhythmScore: 72,
    dynamicsScore: 56,
    overallComment: '''
非常不錯！了解基本的樂句概念。
 
音準：一組樂句構成樂段，理解不同樂段之間的關係和對比。
 
節拍：了解基本的樂句概念，樂句通常是音樂中的一句完整表達，類似於語言中的一句話。
 
強弱變化：一組樂句構成樂段，理解不同樂段之間的關係和對比。
''',
  ).obs;
}