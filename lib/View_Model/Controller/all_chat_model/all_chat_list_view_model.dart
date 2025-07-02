import 'package:get/get.dart';
import '../../../models/All_conversions/all_chat_model.dart';


class AllChatListViewModel extends GetxController {
  var selectedTabIndex = 0.obs;

  var aiChats = <AllChatModel>[
    AllChatModel(title: 'chat_ai_title_1'.tr, subtitle: 'chat_subtitle'.tr, time: '02-28 11:30:28'),
    AllChatModel(title: 'chat_ai_title_2'.tr, subtitle: 'chat_subtitle'.tr, time: '02-28 11:30:28'),
    AllChatModel(title: 'chat_ai_title_3'.tr, subtitle: 'chat_subtitle'.tr, time: '02-28 11:30:28'),
    AllChatModel(title: 'chat_ai_title_4'.tr, subtitle: 'chat_subtitle'.tr, time: '02-28 11:30:28'),
  ].obs;

  var analysisChats = <AllChatModel>[
    AllChatModel(title: 'chat_analysis_title_1'.tr, subtitle: 'chat_subtitle'.tr, time: '02-28 11:30:28'),
    AllChatModel(title: 'chat_analysis_title_2'.tr, subtitle: 'chat_subtitle'.tr, time: '02-28 11:30:28'),
    AllChatModel(title: 'chat_analysis_title_3'.tr, subtitle: 'chat_subtitle'.tr, time: '02-28 11:30:28'),
    AllChatModel(title: 'chat_analysis_title_4'.tr, subtitle: 'chat_subtitle'.tr, time: '02-28 11:30:28'),
  ].obs;

  void deleteChat(int index) {
    if (selectedTabIndex.value == 0) {
      aiChats.removeAt(index);
    } else {
      analysisChats.removeAt(index);
    }
  }

  void changeTab(int index) {
    selectedTabIndex.value = index;
  }
}
