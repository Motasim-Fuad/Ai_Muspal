import 'package:ai_muspal/View_Model/Controller/Violin_analysis_view_model/violin_analysis_chat_view_model.dart';
import 'package:ai_muspal/View_Model/Controller/piano_analysis_view_model/piano_analysis_chat_view_model.dart';
import 'package:ai_muspal/models/analysis_model/piano_analysis_chat_model.dart';
import 'package:ai_muspal/models/analysis_model/violin_analysis__chat_model.dart';
import 'package:ai_muspal/resource/asseets/image_assets.dart';
import 'package:ai_muspal/resource/compunents/RoundButton.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import '../../../bindings/chat_report_binding.dart';
import '../../../resource/Colors/app_colors.dart';
import '../chatReport_view/chat_report_view.dart';
import '../music_chat/widget/typing_loading/tiping_loading.dart';

class PianoAnalysisChatView extends StatefulWidget {
  @override
  State<PianoAnalysisChatView> createState() => _PianoAnalysisChatViewState();
}

class _PianoAnalysisChatViewState extends State<PianoAnalysisChatView> {
  final PianoAnalysisChatViewModel controller = Get.put(
    PianoAnalysisChatViewModel(),
  );

  @override
  void initState() {
    super.initState();

    Future.delayed(Duration(milliseconds: 300), () {
      controller.messages.add(
        PianoAnalysisChatModel(
          content: "pianoChat_welcomeMsg".tr,
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
            SvgPicture.asset(ImageAssets.analyze_profile2, height: 30),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "pianoChat_newChat".tr,
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 13),
                ),
                Text("pianoChat_botName".tr, style: TextStyle(fontSize: 13)),
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
                                  child: SvgPicture.asset(
                                    ImageAssets.analyze_profile2,
                                  ),
                                  radius: 16,
                                ),
                                const SizedBox(width: 8),
                                SizedBox(
                                  child:
                                  TypingLoadingWidget(),
                                ),
                              ],
                            ),
                          ),
                        );
                      }
                      final msg = messages[index];
                      return Align(
                        alignment:
                        msg.isSender
                            ? Alignment.centerRight
                            : Alignment.centerLeft,
                        child: Row(
                          mainAxisAlignment:
                          msg.isSender
                              ? MainAxisAlignment.end
                              : MainAxisAlignment.start,
                          children: [
                            if (!msg.isSender)
                              CircleAvatar(
                                child: SvgPicture.asset(
                                  ImageAssets.analyze_profile2,
                                ),
                                radius: 16,
                              ),
                            if (!msg.isSender) const SizedBox(width: 8),
                            Flexible(
                              child: Container(
                                margin: EdgeInsets.symmetric(vertical: 4),
                                padding: EdgeInsets.all(10),
                                decoration: BoxDecoration(
                                  color:
                                  msg.isSender
                                      ? AppColor.primaryButtonColor
                                      : Colors.grey[200],
                                  borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(12),
                                    topRight: Radius.circular(12),
                                    bottomLeft: Radius.circular(
                                      msg.isSender ? 12 : 0,
                                    ),
                                    bottomRight: Radius.circular(
                                      msg.isSender ? 0 : 12,
                                    ),
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
                },
                icon: Icon(Icons.add_circle_outline),
              ),

              const SizedBox(width: 8),

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
                    onChanged: (value) => controller.scoreName.value = value.trim(),
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: 'pianoChat_scoreInputHint'.tr,
                      hintStyle: TextStyle(
                        color: Colors.grey,
                      ),
                    ),
                    maxLines: 1,
                  ),
                ),
              ),

              const SizedBox(width: 8),

              Obx(
                    () {
                  final isEnable = controller.scoreName.isNotEmpty;
                  return GestureDetector(
                    onTap: isEnable ? () {
                      if (scoreController.text.trim().isNotEmpty) {
                        final name = scoreController.text.trim();
                        Get.back(); // Close input sheet

                        Future.delayed(Duration(milliseconds: 300), () {
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
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          'pianoChat_confirmScoreName'.tr,
                                          style: TextStyle(
                                            fontSize: 18,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                        GestureDetector(
                                          onTap: () => Get.back(),
                                          child: Icon(Icons.close, size: 24),
                                        ),
                                      ],
                                    ),
                                    SizedBox(height: 20),

                                    Text('pianoChat_scoreNameIs'.tr, style: TextStyle(fontSize: 16)),
                                    SizedBox(height: 4),
                                    Text(
                                      name,
                                      style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    SizedBox(height: 8),
                                    Text(
                                      'pianoChat_clickBackToReenter'.tr,
                                      style: TextStyle(
                                        fontSize: 14,
                                        color: Colors.grey,
                                      ),
                                    ),
                                    SizedBox(height: 24),

                                    SizedBox(
                                      width: double.infinity,
                                      child: ElevatedButton(
                                        onPressed: () {
                                          controller.addScoreName(name);
                                          controller.currentStep.value = 3;
                                          Get.back();

                                          controller.isAnalyzing.value = true;

                                          Future.delayed(Duration(seconds: 2), () {
                                            controller.messages.add(
                                              PianoAnalysisChatModel(
                                                content: "pianoChat_analysisInProgress".tr,
                                                audio: '',
                                                video: '',
                                                isSender: false,
                                              ),
                                            );

                                            controller.isAnalyzing.value = false;

                                            controller.currentStep.value = 4;
                                          });
                                        },

                                        child: Text('pianoChat_confirmAnalyze'.tr),
                                        style: ElevatedButton.styleFrom(
                                          backgroundColor: Color(0xFFFF5A5F),
                                          foregroundColor: Colors.white,
                                          padding: EdgeInsets.symmetric(vertical: 14),
                                          shape: RoundedRectangleBorder(
                                            borderRadius: BorderRadius.circular(8),
                                          ),
                                        ),
                                      ),
                                    ),
                                    SizedBox(height: 12),

                                    SizedBox(
                                      width: double.infinity,
                                      child: OutlinedButton(
                                        onPressed: () => Get.back(),
                                        child: Text('pianoChat_reenter'.tr),
                                        style: OutlinedButton.styleFrom(
                                          foregroundColor: Color(0xFFFF5A5F),
                                          side: BorderSide(
                                            color: Color(0xFFFF5A5F),
                                            width: 1.5,
                                          ),
                                          padding: EdgeInsets.symmetric(vertical: 14),
                                          shape: RoundedRectangleBorder(
                                            borderRadius: BorderRadius.circular(8),
                                          ),
                                        ),
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
                    } : null,

                    child: CircleAvatar(
                      radius: 22,
                      backgroundColor:
                      isEnable ? Color(0xFFFF5A5F) : Colors.grey,
                      child: Icon(Icons.arrow_forward, color: Colors.white),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
      isScrollControlled: true,
    );
  }

  Widget _buildMessageContent(PianoAnalysisChatModel msg) {
    if (msg.content.isNotEmpty) {
      return Text(msg.content);
    } else if (msg.audio.isNotEmpty) {
      return Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(Icons.audiotrack, color: Colors.blue),
          SizedBox(width: 6),
          Text("pianoChat_audioFile".tr),
        ],
      );
    } else if (msg.video.isNotEmpty) {
      return Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(Icons.videocam, color: Colors.green),
          SizedBox(width: 6),
          Text("pianoChat_videoFile".tr),
        ],
      );
    } else {
      return Text("pianoChat_unsupported".tr);
    }
  }

  Widget _buildInputBar() {
    return SafeArea(
      child: Align(
        alignment: Alignment.centerLeft,
        child: Obx(() {
          if (!controller.uploadCompleted.value) {
            // Step 1: Upload audio/video
            return RoundButton(
              title: "pianoChat_uploadAudioVideo".tr,
              onPress: () {
                Get.bottomSheet(
                  Container(
                    padding: EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.vertical(
                        top: Radius.circular(16),
                      ),
                    ),
                    child: Wrap(
                      children: [
                        ListTile(
                          leading: Icon(Icons.audiotrack),
                          title: Text("pianoChat_uploadAudio".tr),
                          onTap: () {
                            controller.pickMedia('audio');
                            Get.back();
                          },
                        ),
                        ListTile(
                          leading: Icon(Icons.videocam),
                          title: Text("pianoChat_uploadVideo".tr),
                          onTap: () {
                            controller.pickMedia('video');
                            Get.back();
                          },
                        ),
                      ],
                    ),
                  ),
                );
              },
            );
          } else if (!controller.sheetMusicHandled.value) {
            // Step 2: Upload sheet music or skip
            return Row(
              children: [
                Expanded(
                  child: RoundButton(
                    title: "pianoChat_uploadSheetMusic".tr,
                    onPress: () {
                      controller.pickSheetMusic();
                    },
                  ),
                ),
                SizedBox(width: 10),
                Expanded(
                  child: RoundButton(
                    buttonColor: Color(0xff000000),
                    title: "pianoChat_skip".tr,
                    onPress: () {
                      controller.messages.add(
                        PianoAnalysisChatModel(
                          content: "pianoChat_userSkippedSheetMusic".tr,
                          audio: '',
                          video: '',
                          isSender: true,
                        ),
                      );
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
                    title: "pianoChat_provideScoreName".tr,
                    onPress: () {
                      _showMusicScoreNameInput();
                    },
                  ),
                ),
                SizedBox(width: 10),
                Expanded(
                  child: RoundButton(
                    title: "pianoChat_skip".tr,
                    buttonColor: Color(0xff000000),
                    onPress: () {
                      controller.messages.add(
                        PianoAnalysisChatModel(
                          content: "pianoChat_userSkippedScoreName".tr,
                          audio: '',
                          video: '',
                          isSender: true,
                        ),
                      );
                      controller.currentStep.value = 3;
                    },
                  ),
                ),
              ],
            );
          } else if (controller.currentStep.value == 3) {
            return Row(
              children: [
                SizedBox(width: 10),
                Expanded(
                  child: RoundButton(
                    title: "pianoChat_reupload".tr,
                    buttonColor: Colors.grey,
                    onPress: () {
                      controller.uploadCompleted.value = false;
                      controller.sheetMusicHandled.value = false;
                      controller.currentStep.value = 0;
                      controller.messages.clear();
                      Future.delayed(Duration(milliseconds: 300), () {
                        controller.messages.add(
                          PianoAnalysisChatModel(
                            content: "pianoChat_welcomeMsg".tr,
                            audio: '',
                            video: '',
                            isSender: false,
                          ),
                        );
                      });
                    },
                  ),
                ),
              ],
            );
          } else if (controller.currentStep.value == 4) {
            return Obx(
                  () => Column(
                children: [
                  if (controller.isAnalyzing.value) ...[
                    CircularProgressIndicator(),
                    SizedBox(height: 10),
                  ],
                  RoundButton(
                    title: "pianoChat_seeReport".tr,
                    buttonColor: AppColor.prymaryTextColor,
                    onPress:
                    controller.isAnalyzing.value
                        ? null
                        : () {
                      Get.to(
                            () => ChatReportView(),
                        binding: ReportBinding(),
                      );
                    },
                  ),
                ],
              ),
            );
          } else {
            return Row(
              children: [
                Expanded(
                  child: RoundButton(
                    buttonColor: Color(0xff988a8a),
                    title: "pianoChat_seeReport".tr,
                    onPress: () {
                      // Optionally handle here
                    },
                  ),
                ),
              ],
            );
          }
        }),
      ),
    );
  }
}
