import 'package:get/get.dart';
import '../../../models/All_conversions/all_chat_model.dart';


class AllChatListViewModel extends GetxController {
  var selectedTabIndex = 0.obs;

  var aiChats = <AllChatModel>[
    AllChatModel(title: '如何理解樂理基礎和樂句結構1', subtitle: '理解音樂理論的基礎...', time: '02-28 11:30:28'),
    AllChatModel(title: '如何理解樂理基礎和樂句結構2', subtitle: '理解音樂理論的基礎...', time: '02-28 11:30:28'),
    AllChatModel(title: '如何理解樂理基礎和樂句結3', subtitle: '理解音樂理論的基礎...', time: '02-28 11:30:28'),
    AllChatModel(title: '如何理解樂理基礎和樂句結構4', subtitle: '理解音樂理論的基礎...', time: '02-28 11:30:28'),
    // Add more...
  ].obs;

  var analysisChats = <AllChatModel>[
    AllChatModel(title: '演奏分析1', subtitle: '理解音樂理論的基礎...', time: '02-28 11:30:28'),
    AllChatModel(title: '演奏分析2', subtitle: '理解音樂理論的基礎...', time: '02-28 11:30:28'),
    AllChatModel(title: '演奏分析3', subtitle: '理解音樂理論的基礎...', time: '02-28 11:30:28'),
    AllChatModel(title: '演奏分析4', subtitle: '理解音樂理論的基礎...', time: '02-28 11:30:28'),
    // Add more...
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
