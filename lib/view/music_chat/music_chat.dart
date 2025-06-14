import 'dart:io';
import 'package:ai_muspal/resource/App_routes/routes_name.dart';

import 'package:ai_muspal/view/music_chat/widget/typing_loading/tiping_loading.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../View_Model/Controller/musical_Chat/music_chat_viewmodel.dart';
import '../../models/music_chat/chat_message.dart';
import '../../resource/asseets/image_assets.dart';
import '../../utils/utils.dart';

class MusicChatView extends StatefulWidget {
  MusicChatView({super.key});

  @override
  State<MusicChatView> createState() => _MusicChatViewState();
}

class _MusicChatViewState extends State<MusicChatView>
    with WidgetsBindingObserver {
  final MusicChatViewModel controller = Get.find();

  late ScrollController _scrollController;

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();

    // Observe changes to the widget binding (keyboard, etc.)
    WidgetsBinding.instance.addObserver(this);

    // Scroll to bottom when new messages arrive
    ever(controller.chatMessages, (_) {
      _scrollToBottom(delay: 100);
    });
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    _scrollController.dispose();
    super.dispose();
  }

  void _scrollToBottom({int delay = 0}) {
    if (_scrollController.hasClients) {
      Future.delayed(Duration(milliseconds: delay), () {
        _scrollController.animateTo(
          _scrollController.position.maxScrollExtent,
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeOut,
        );
      });
    }
  }

  @override
  void didChangeMetrics() {
    final bottomInset = WidgetsBinding.instance.window.viewInsets.bottom;
    final isKeyboardOpen = bottomInset > 0;

    if (isKeyboardOpen) {
      // Scroll after keyboard transition
      Future.delayed(const Duration(milliseconds: 150), () {
        _scrollToBottom();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            _buildAppBar(),
            _buildChatMessages(),
            ChatInputField(controller: controller),
          ],
        ),
      ),
    );
  }

  Widget _buildAppBar() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8),
      child: Row(
        children: [
          BackButton(onPressed: () => Get.back()),
          const CircleAvatar(
            backgroundImage: AssetImage(ImageAssets.music_chat),
          ),
          const SizedBox(width: 12),
          const Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("新的對話", style: TextStyle(fontSize: 16)),
              Text("Violin bot", style: TextStyle(fontSize: 12)),
            ],
          ),

          Spacer(),
          // 🔴 Reset Limit Button (for development or manual reset)
          IconButton(
            icon: const Icon(Icons.refresh, color: Colors.red),
            onPressed: () {
              controller.hasReachedLimit.value = false;
              controller.messagesSentToday.value = 0;
              Utils.snackBar("重設完成", "訊息限制已清除");
            },
          ),
        ],
      ),
    );
  }

  Widget _buildChatMessages() {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Obx(() {
          final messages = controller.chatMessages.value;
          final isTyping = controller.isBotTyping.value;
          final hasLimit = controller.hasReachedLimit.value;

          return Column(
            children: [
              if (hasLimit)
                Container(
                  color: Colors.yellow.shade100,
                  padding: const EdgeInsets.all(12),
                  margin: const EdgeInsets.symmetric(vertical: 8),
                  child: Row(
                    children: [
                      const Icon(Icons.warning, color: Colors.orange),
                      const SizedBox(width: 8),
                      const Expanded(
                        child: Text(
                          "已達到今天對話上限",
                          style: TextStyle(fontSize: 14),
                        ),
                      ),
                      TextButton(
                        onPressed: () async {
                          final upgraded = await Get.toNamed(
                            RouteName.premiumMemberView,
                          );
                          if (upgraded == true) {
                            controller.isPremiumUser = true;
                            controller.hasReachedLimit.value = false;
                            controller.messagesSentToday.value = 0;
                            Utils.snackBar("升級成功", "您現在是 Premium 會員");
                          }
                        },
                        child: const Text("前往升級"),
                      ),
                    ],
                  ),
                ),

              Expanded(
                child: ListView.builder(
                  controller: _scrollController, // ✅ Attach controller
                  itemCount: messages.length + (isTyping ? 1 : 0),
                  itemBuilder: (context, index) {
                    if (index == messages.length && isTyping) {
                      return _buildTypingIndicator();
                    }
                    return Message(message: messages[index]);
                  },
                ),
              ),
            ],
          );
        }),
      ),
    );
  }
}

Widget _buildTypingIndicator() {
  return Align(
    alignment: Alignment.centerLeft,
    child: Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        children: [
          const CircleAvatar(
            radius: 12,
            backgroundImage: AssetImage(ImageAssets.music_chat),
          ),
          const SizedBox(width: 8),
          TypingLoadingWidget(),
        ],
      ),
    ),
  );
}

class ChatInputField extends StatelessWidget {
  final MusicChatViewModel controller;

  const ChatInputField({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      final hasAttachment = controller.pendingAttachmentPath.isNotEmpty;

      return SafeArea(
        child: Padding(
          padding: EdgeInsets.all(12.0),
          child: Row(
            children: [
              // Add Button
              IconButton(
                onPressed: _showAttachmentBottomSheet,
                icon: const Icon(Icons.add_circle_outline, size: 28),
              ),

              // Message Input Container
              Expanded(
                child: Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 12,
                    vertical: 8,
                  ),
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey.shade300),
                    borderRadius: BorderRadius.circular(24),
                  ),
                  child: Row(
                    children: [
                      // Optional attachment preview inside input
                      if (hasAttachment)
                        Stack(
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(8),
                              child: Image.file(
                                File(controller.pendingAttachmentPath.value),
                                height: 36,
                                width: 36,
                                fit: BoxFit.cover,
                              ),
                            ),
                            Positioned(
                              top: -6,
                              right: -6,
                              child: GestureDetector(
                                onTap: () {
                                  controller.pendingAttachmentPath.value = '';
                                  controller.pendingAttachmentType.value = null;
                                },
                                child: const CircleAvatar(
                                  radius: 10,
                                  backgroundColor: Colors.white,
                                  child: Icon(Icons.close, size: 14),
                                ),
                              ),
                            ),
                          ],
                        ),

                      const SizedBox(width: 8),

                      // Text input
                      Expanded(
                        child: TextField(
                          controller: controller.messageController,
                          onChanged: (value) {
                            controller.isInputNotEmpty.value =
                                value.trim().isNotEmpty;
                          },
                          decoration: const InputDecoration(
                            border: InputBorder.none,
                            hintText: '開始新對話', // "Start a new conversation"
                          ),
                          maxLines: null,
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              const SizedBox(width: 8),

              // Send Button
              Obx(() {
                final isEnable =
                    (controller.isInputNotEmpty.value ||
                        controller.pendingAttachmentPath.isNotEmpty) &&
                    !controller
                        .hasReachedLimit
                        .value; // 🚫 Disable if limit reached

                return GestureDetector(
                  onTap:
                      isEnable
                          ? () {
                            controller.sendMessage();
                          }
                          : null,
                  child: CircleAvatar(
                    radius: 22,
                    backgroundColor:
                        isEnable ? const Color(0xFFFF5A5F) : Colors.grey,
                    child: const Icon(Icons.arrow_forward, color: Colors.white),
                  ),
                );
              }),
            ],
          ),
        ),
      );
    });
  }

  void _showAttachmentBottomSheet() {
    Get.bottomSheet(
      Container(
        padding: const EdgeInsets.all(20),
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.vertical(top: Radius.circular(25)),
        ),
        child: Wrap(
          children: [
            ListTile(
              title: Text("上傳附件"),
              trailing: IconButton(
                onPressed: () {
                  Get.back();
                },
                icon: Icon(Icons.close),
              ),
            ),
            Divider(color: Colors.grey, height: 1),
            ListTile(
              leading: const Icon(Icons.camera_alt_outlined),
              title: const Text("Camera"),
              onTap: () {
                Get.back();
                controller.pickImageFromCamera();
              },
            ),
            ListTile(
              leading: const Icon(Icons.photo_camera_back_outlined),
              title: const Text("Gallery"),
              onTap: () {
                Get.back();
                controller.pickImageFromGallery();
              },
            ),
            ListTile(
              leading: const Icon(Icons.file_present_outlined),
              title: const Text("File"),
              onTap: () {
                Get.back();
                controller.pickFile();
              },
            ),
          ],
        ),
      ),
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
    );
  }
}

class Message extends StatelessWidget {
  final ChatMessage message;

  const Message({super.key, required this.message});

  @override
  Widget build(BuildContext context) {
    final isSender = message.isSender;
    final alignment = isSender ? Alignment.centerRight : Alignment.centerLeft;
    final color = isSender ? Color(0xFFFF5D47) : Colors.grey.shade200;

    return Align(
      alignment: alignment,
      child: Row(
        mainAxisAlignment:
            isSender ? MainAxisAlignment.end : MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (!isSender)
            const Padding(
              padding: EdgeInsets.only(right: 8.0),
              child: CircleAvatar(
                radius: 16,
                backgroundImage: AssetImage(ImageAssets.music_chat),
              ),
            ),
          Flexible(
            child: Container(
              margin: EdgeInsets.only(
                top: 4,
                bottom: 4,
                left: isSender ? 50 : 0, // ✅ Add margin to separate sides
                right: isSender ? 0 : 50,
              ),
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: color,
                borderRadius: BorderRadius.circular(12),
              ),
              child: _buildMessageContent(),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildMessageContent() {
    List<Widget> contentWidgets = [];

    // Attachment
    if (message.attachmentPath != null) {
      if (message.messageType == ChatMessageType.image) {
        contentWidgets.add(
          Padding(
            padding: const EdgeInsets.only(bottom: 8.0),
            child: Image.file(
              File(message.attachmentPath!),
              height: 200,
              width: 200,
            ),
          ),
        );
      } else if (message.messageType == ChatMessageType.pdf) {
        contentWidgets.add(
          _buildFileTile(
            Icons.picture_as_pdf,
            "PDF File",
            message.attachmentPath!,
          ),
        );
      } else if (message.messageType == ChatMessageType.doc) {
        contentWidgets.add(
          _buildFileTile(
            Icons.description,
            "Word Document",
            message.attachmentPath!,
          ),
        );
      } else {
        contentWidgets.add(
          _buildFileTile(
            Icons.insert_drive_file,
            "File",
            message.attachmentPath!,
          ),
        );
      }
    }

    // Text
    if (message.text.isNotEmpty) {
      contentWidgets.add(
        Text(message.text, style: const TextStyle(fontSize: 16)),
      );
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: contentWidgets,
    );
  }

  Widget _buildFileTile(IconData icon, String label, String path) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(icon, color: Colors.redAccent),
        const SizedBox(width: 8),
        Flexible(
          child: Text(
            label,
            style: const TextStyle(fontSize: 16, color: Colors.black87),
          ),
        ),
      ],
    );
  }
}
