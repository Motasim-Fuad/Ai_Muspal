import 'package:get/get.dart';
import '../View_Model/Controller/musical_Chat/music_chat_viewmodel.dart';


class MusicChatBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => MusicChatViewModel());
  }
}