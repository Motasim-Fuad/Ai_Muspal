import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../View_Model/Controller/all_chat_model/all_chat_list_view_model.dart';
import 'widget/chat_item_tile.dart';

class AllChatListView extends StatelessWidget {
  const AllChatListView({super.key});

  @override
  Widget build(BuildContext context) {
    final AllChatListViewModel controller = Get.put(AllChatListViewModel());

    return Scaffold(
      appBar: AppBar(
        title: const Text('所有對話'),
        centerTitle: true,
        leading: const BackButton(),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            Obx(
              () => Row(
                children: [
                  Expanded(
                    child: InkWell(
                      borderRadius: BorderRadius.circular(10),
                      onTap: () => controller.changeTab(0),
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color:
                              controller.selectedTabIndex.value == 0
                                  ? Colors.black
                                  : Colors.grey.shade200,
                        ),
                        padding: const EdgeInsets.symmetric(vertical: 12),
                        alignment: Alignment.center,
                        child: Text(
                          'AI 對話',
                          style: TextStyle(
                            color:
                                controller.selectedTabIndex.value == 0
                                    ? Colors.white
                                    : Colors.black,
                          ),
                        ),
                      ),
                    ),
                  ),

                  Expanded(
                    child: InkWell(
                      borderRadius: BorderRadius.circular(10),
                      onTap: () => controller.changeTab(1),
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color:
                              controller.selectedTabIndex.value == 1
                                  ? Colors.black
                                  : Colors.grey.shade200,
                        ),
                        padding: const EdgeInsets.symmetric(vertical: 12),
                        alignment: Alignment.center,
                        child: Text(
                          '分析對話',
                          style: TextStyle(
                            color:
                                controller.selectedTabIndex.value == 1
                                    ? Colors.white
                                    : Colors.black,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 10),
            Expanded(
              child: Obx(() {
                final chats =
                    controller.selectedTabIndex.value == 0
                        ? controller.aiChats
                        : controller.analysisChats;

                return ListView.builder(
                  itemCount: chats.length,
                  itemBuilder: (context, index) {
                    return ChatItemTile(
                      key: ValueKey(chats[index].title), // <- add this
                      chat: chats[index],
                      index: index,
                    );
                  },
                );
              }),
            ),
          ],
        ),
      ),
    );
  }
}
