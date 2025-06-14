import 'package:get/get.dart';
import '../View_Model/Controller/chat_report_view_model/chat_report_view_model.dart';


class ReportBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ChatReportViewModel>(() => ChatReportViewModel());
  }
}