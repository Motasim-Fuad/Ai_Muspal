

import 'package:ai_muspal/View_Model/Controller/Violin_analysis_view_model/violin_analysis_chat_view_model.dart';
import 'package:ai_muspal/models/analysis_model/violin_analysis__chat_model.dart';
import 'package:ai_muspal/resource/asseets/image_assets.dart';
import 'package:ai_muspal/resource/compunents/RoundButton.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import '../../../bindings/chat_report_binding.dart';
import '../../../resource/Colors/app_colors.dart';
import '../../chatReport_view/chat_report_view.dart';
import '../../music_chat/widget/typing_loading/tiping_loading.dart';

class ViolinAnalysisChatView extends StatefulWidget {
  @override
  State<ViolinAnalysisChatView> createState() => _ViolinAnalysisChatViewState();
}

class _ViolinAnalysisChatViewState extends State<ViolinAnalysisChatView> {
  final ViolinAnalysisChatViewModel controller = Get.put(ViolinAnalysisChatViewModel());

  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(milliseconds: 300), () {
      controller.messages.add(
        ViolinAnalysisChatModel(
          content: "violinChat_welcome".tr,
          audio: '',
          video: '',
          isSender: false,
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            SvgPicture.asset(ImageAssets.analyze_profile1, height: 30),
            Column(
              children: [
                Text("violinChat_newConversation".tr, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 13)),
                Text("violinChat_botName".tr, style: TextStyle(fontSize: 13)),
              ],
            ),
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Obx(() {
                  final messages = controller.messages;
                  final isTyping = controller.isAnalyzing.value;

                  return ListView.builder(
                    itemCount: messages.length + (isTyping ? 1 : 0),
                    itemBuilder: (context, index) {
                      if (index == messages.length && isTyping) {
                        return Align(
                          alignment: Alignment.centerLeft,
                          child: Padding(
                            padding: const EdgeInsets.symmetric(vertical: 8.0),
                            child: Row(
                              children: [
                                CircleAvatar(
                                  child: SvgPicture.asset(ImageAssets.analyze_profile1),
                                  radius: 16,
                                ),
                                const SizedBox(width: 8),
                                TypingLoadingWidget(),
                              ],
                            ),
                          ),
                        );
                      }
                      final msg = messages[index];
                      return Align(
                        alignment: msg.isSender ? Alignment.centerRight : Alignment.centerLeft,
                        child: Row(
                          mainAxisAlignment: msg.isSender ? MainAxisAlignment.end : MainAxisAlignment.start,
                          children: [
                            if (!msg.isSender)
                              CircleAvatar(
                                child: SvgPicture.asset(ImageAssets.analyze_profile1),
                                radius: 16,
                              ),
                            if (!msg.isSender) const SizedBox(width: 8),
                            Flexible(
                              child: Container(
                                margin: EdgeInsets.symmetric(vertical: 4),
                                padding: EdgeInsets.all(10),
                                decoration: BoxDecoration(
                                  color: msg.isSender ? AppColor.primaryButtonColor : Colors.grey[200],
                                  borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(12),
                                    topRight: Radius.circular(12),
                                    bottomLeft: Radius.circular(msg.isSender ? 12 : 0),
                                    bottomRight: Radius.circular(msg.isSender ? 0 : 12),
                                  ),
                                ),
                                child: _buildMessageContent(msg),
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                  );
                }),
              ),
            ),
            _buildInputBar(),
          ],
        ),
      ),
    );
  }

  Widget _buildMessageContent(ViolinAnalysisChatModel msg) {
    if (msg.content.isNotEmpty) {
      return Text(msg.content.tr);
    } else if (msg.audio.isNotEmpty) {
      return Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(Icons.audiotrack, color: Colors.blue),
          SizedBox(width: 6),
          Text("violinChat_audioFile".tr),
        ],
      );
    } else if (msg.video.isNotEmpty) {
      return Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(Icons.videocam, color: Colors.green),
          SizedBox(width: 6),
          Text("violinChat_videoFile".tr),
        ],
      );
    } else {
      return Text("violinChat_unsupported".tr);
    }
  }

  Widget _buildInputBar() {
    return SafeArea(
      child: Align(
        alignment: Alignment.centerLeft,
        child: Obx(() {
          if (!controller.uploadCompleted.value) {
            return RoundButton(
              title: "violinChat_uploadAudioVideo".tr,
              onPress: () => _showUploadOptions(),
            );
          } else if (!controller.sheetMusicHandled.value) {
            return Row(
              children: [
                Expanded(
                  child: RoundButton(
                    title: "violinChat_uploadScore".tr,
                    onPress: () => controller.pickSheetMusic(),
                  ),
                ),
                SizedBox(width: 10),
                Expanded(
                  child: RoundButton(
                    buttonColor: Color(0xff000000),
                    title: "violinChat_skip".tr,
                    onPress: () {
                      controller.messages.add(ViolinAnalysisChatModel(content: "User skipped sheet music upload.", audio: '', video: '', isSender: true));
                      controller.sheetMusicHandled.value = true;
                      controller.currentStep.value = 2;
                    },
                  ),
                ),
              ],
            );
          } else if (controller.currentStep.value == 2) {
            return Row(
              children: [
                Expanded(
                  child: RoundButton(
                    title: "violinChat_enterScoreName".tr,
                    onPress: () => _showMusicScoreNameInput(),
                  ),
                ),
                SizedBox(width: 10),
                Expanded(
                  child: RoundButton(
                    buttonColor: Color(0xff000000),
                    title: "violinChat_skip".tr,
                    onPress: () {
                      controller.messages.add(ViolinAnalysisChatModel(content: "User skipped score name input.", audio: '', video: '', isSender: true));
                      controller.currentStep.value = 3;
                    },
                  ),
                ),
              ],
            );
          } else if (controller.currentStep.value == 3) {
            return RoundButton(
              title: "violinChat_resubmit".tr,
              buttonColor: Colors.grey,
              onPress: () {
                controller.uploadCompleted.value = false;
                controller.sheetMusicHandled.value = false;
                controller.currentStep.value = 0;
                controller.messages.clear();
                Future.delayed(Duration(milliseconds: 300), () {
                  controller.messages.add(ViolinAnalysisChatModel(content: "violinChat_welcome".tr, audio: '', video: '', isSender: false));
                });
              },
            );
          } else if (controller.currentStep.value == 4) {
            return Obx(() => Column(
              children: [
                if (controller.isAnalyzing.value) ...[
                  CircularProgressIndicator(),
                  SizedBox(height: 10),
                ],
                RoundButton(
                  title: "violinChat_viewReport".tr,
                  buttonColor: AppColor.prymaryTextColor,
                  onPress: controller.isAnalyzing.value ? null : () {
                    Get.to(() => ChatReportView(), binding: ReportBinding());
                  },
                ),
              ],
            ));
          } else {
            return RoundButton(
              title: "violinChat_viewReport".tr,
              buttonColor: Color(0xff988a8a),
              onPress: () {},
            );
          }
        }),
      ),
    );
  }

  void _showUploadOptions() {
    Get.bottomSheet(
      Container(
        padding: EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
        ),
        child: Wrap(
          children: [
            ListTile(
              leading: Icon(Icons.audiotrack),
              title: Text("violinChat_uploadAudio".tr),
              onTap: () {
                controller.pickMedia('audio');
                Get.back();
              },
            ),
            ListTile(
              leading: Icon(Icons.videocam),
              title: Text("violinChat_uploadVideo".tr),
              onTap: () {
                controller.pickMedia('video');
                Get.back();
              },
            ),
          ],
        ),
      ),
    );
  }


  void _showMusicScoreNameInput() {
    final scoreController = TextEditingController();
    Get.bottomSheet(
      Container(
        padding: const EdgeInsets.all(16),
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
        ),
        child: SafeArea(
          child: Row(
            children: [
              IconButton(
                onPressed: () {
                  controller.pickSheetMusic();
                  Get.back();
                },
                icon: const Icon(Icons.add_circle_outline),
              ),

              const SizedBox(width: 8),

              // Input Container
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
                  child: TextField(
                    controller: scoreController,
                    onChanged: (value) =>
                    controller.scoreName.value = value.trim(),
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: 'violinChat_scorePlaceholder'.tr,
                      hintStyle: const TextStyle(color: Colors.grey),
                    ),
                    maxLines: 1,
                  ),
                ),
              ),

              const SizedBox(width: 8),

              // Send Button
              Obx(() {
                final isEnable = controller.scoreName.isNotEmpty;
                return GestureDetector(
                  onTap: isEnable
                      ? () {
                    if (scoreController.text.trim().isNotEmpty) {
                      final name = scoreController.text.trim();
                      Get.back();

                      Future.delayed(const Duration(milliseconds: 300), () {
                        Get.bottomSheet(
                          Container(
                            padding: const EdgeInsets.all(20),
                            decoration: const BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.vertical(
                                top: Radius.circular(20),
                              ),
                            ),
                            child: SafeArea(
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                crossAxisAlignment:
                                CrossAxisAlignment.start,
                                children: [
                                  // Top Title + Close Button
                                  Row(
                                    mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        'violinChat_confirmScoreTitle'.tr,
                                        style: const TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      GestureDetector(
                                        onTap: () => Get.back(),
                                        child: const Icon(Icons.close,
                                            size: 24),
                                      ),
                                    ],
                                  ),
                                  const SizedBox(height: 20),

                                  // Music name
                                  Text(
                                      'violinChat_scoreNameIs'
                                          .tr, // 樂譜名稱是:
                                      style: const TextStyle(fontSize: 16)),
                                  const SizedBox(height: 4),
                                  Text(
                                    name,
                                    style: const TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  const SizedBox(height: 8),
                                  Text(
                                    'violinChat_scoreNote'.tr,
                                    style: const TextStyle(
                                      fontSize: 14,
                                      color: Colors.grey,
                                    ),
                                  ),
                                  const SizedBox(height: 24),

                                  // Confirm Button
                                  SizedBox(
                                    width: double.infinity,
                                    child: ElevatedButton(
                                      onPressed: () {
                                        controller.addScoreName(name);
                                        controller.currentStep.value = 3;
                                        Get.back();

                                        controller.isAnalyzing.value = true;

                                        Future.delayed(
                                            const Duration(seconds: 2), () {
                                          controller.messages.add(
                                            ViolinAnalysisChatModel(
                                              content:
                                              'violinChat_analyzing'.tr,
                                              audio: '',
                                              video: '',
                                              isSender: false,
                                            ),
                                          );

                                          controller.isAnalyzing.value =
                                          false;
                                          controller.currentStep.value = 4;
                                        });
                                      },
                                      style: ElevatedButton.styleFrom(
                                        backgroundColor:
                                        const Color(0xFFFF5A5F),
                                        foregroundColor: Colors.white,
                                        padding: const EdgeInsets.symmetric(
                                          vertical: 14,
                                        ),
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                          BorderRadius.circular(8),
                                        ),
                                      ),
                                      child:
                                      Text('violinChat_confirmAnalyze'.tr),
                                    ),
                                  ),
                                  const SizedBox(height: 12),

                                  // Re-enter Button
                                  SizedBox(
                                    width: double.infinity,
                                    child: OutlinedButton(
                                      onPressed: () => Get.back(),
                                      style: OutlinedButton.styleFrom(
                                        foregroundColor:
                                        const Color(0xFFFF5A5F),
                                        side: const BorderSide(
                                          color: Color(0xFFFF5A5F),
                                          width: 1.5,
                                        ),
                                        padding: const EdgeInsets.symmetric(
                                          vertical: 14,
                                        ),
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                          BorderRadius.circular(8),
                                        ),
                                      ),
                                      child: Text('violinChat_reenter'.tr),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          isDismissible: false,
                          isScrollControlled: true,
                        );
                      });
                    }
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
      ),
      isScrollControlled: true,
    );
  }

}




