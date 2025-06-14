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
          content: "歡迎您，如果您準備好了，可以隨時上傳你的音頻或視頻，我會進行下一步分析。,     意音頻愈長，分析時間會愈久。",

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
              children: [
                Text(
                  "新的對話",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 13),
                ),
                Text("Piano bot", style: TextStyle(fontSize: 13)),
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
                    //controller: controller.scrollController, // ✅ attach controller
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
                                  TypingLoadingWidget(), //loading Container
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
                    onChanged: (value) => controller.scoreName.value = value.trim(),
                    decoration: const InputDecoration(
                      border: InputBorder.none,
                      hintText: '與MusPal對話', // placeholder from image
                      hintStyle: TextStyle(
                        color: Colors.grey,
                      ), // match faded text
                    ),
                    maxLines: 1,
                  ),
                ),
              ),

              const SizedBox(width: 8),

              // Send Button
              Obx(
                    () {
                  final isEnable = controller.scoreName.isNotEmpty;
                  return GestureDetector(

                    onTap: isEnable ?() {
                      if (scoreController.text.trim().isNotEmpty) {
                        final name = scoreController.text.trim();
                        Get.back(); // Close input sheet

                        // ✅ Show confirmation bottom sheet
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
                                    // Top Title + Close Button
                                    Row(
                                      mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          '確認樂譜名稱',
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

                                    // Music name
                                    Text('樂譜名稱是：', style: TextStyle(fontSize: 16)),
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
                                      '點選返回可重新輸入樂譜名稱。',
                                      style: TextStyle(
                                        fontSize: 14,
                                        color: Colors.grey,
                                      ),
                                    ),
                                    SizedBox(height: 24),

                                    // Primary Button
                                    SizedBox(
                                      width: double.infinity,
                                      child: ElevatedButton(
                                        onPressed: () {
                                          controller.addScoreName(name);
                                          controller.currentStep.value = 3;
                                          Get.back(); // Close bottom sheet

                                          // Show TypingLoadingWidget
                                          controller.isAnalyzing.value = true;

                                          // Optional: Simulate delay then stop typing and add bot reply
                                          Future.delayed(Duration(seconds: 2), () {
                                            controller.messages.add(
                                              PianoAnalysisChatModel(
                                                content: "正在分析中，請稍候…",
                                                audio: '',
                                                video: '',
                                                isSender: false,
                                              ),
                                            );

                                            controller.isAnalyzing.value = false;

                                            // Move to next step if needed
                                            controller.currentStep.value = 4;
                                          });
                                        },

                                        child: Text('確認並進行分析'),
                                        style: ElevatedButton.styleFrom(
                                          backgroundColor: Color(
                                            0xFFFF5A5F,
                                          ), // Red like image
                                          foregroundColor: Colors.white,
                                          padding: EdgeInsets.symmetric(
                                            vertical: 14,
                                          ),
                                          shape: RoundedRectangleBorder(
                                            borderRadius: BorderRadius.circular(8),
                                          ),
                                        ),
                                      ),
                                    ),
                                    SizedBox(height: 12),

                                    // Secondary Button (Outlined)
                                    SizedBox(
                                      width: double.infinity,
                                      child: OutlinedButton(
                                        onPressed: () => Get.back(),
                                        child: Text('重新輸入'),
                                        style: OutlinedButton.styleFrom(
                                          foregroundColor: Color(0xFFFF5A5F),
                                          side: BorderSide(
                                            color: Color(0xFFFF5A5F),
                                            width: 1.5,
                                          ),
                                          padding: EdgeInsets.symmetric(
                                            vertical: 14,
                                          ),
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

                    child:  CircleAvatar(
                      radius: 22,
                      backgroundColor:
                      isEnable ?  Color(0xFFFF5A5F) : Colors.grey, // match icon background color from image
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
          Text("Audio File"),
        ],
      );
    } else if (msg.video.isNotEmpty) {
      return Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(Icons.videocam, color: Colors.green),
          SizedBox(width: 6),
          Text("Video File"),
        ],
      );
    } else {
      return Text("Unsupported message type");
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
              title: "上傳音頻/視頻",
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
                          title: Text("Upload Audio"),
                          onTap: () {
                            controller.pickMedia('audio');
                            Get.back();
                          },
                        ),
                        ListTile(
                          leading: Icon(Icons.videocam),
                          title: Text("Upload Video"),
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
                    title: "上傳樂譜",
                    onPress: () {
                      controller.pickSheetMusic();
                    },
                  ),
                ),
                SizedBox(width: 10),
                Expanded(
                  child: RoundButton(
                    buttonColor: Color(0xff000000),
                    title: "略過",
                    onPress: () {
                      controller.messages.add(
                        PianoAnalysisChatModel(
                          content: "User skipped sheet music upload.",
                          audio: '',
                          video: '',
                          isSender: true,
                        ),
                      );
                      controller.sheetMusicHandled.value = true;
                      controller.currentStep.value = 2; // ✅ Move to next step
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
                    title: "供樂譜名稱",
                    onPress: () {
                      _showMusicScoreNameInput();
                    },
                  ),
                ),
                SizedBox(width: 10),
                Expanded(
                  child: RoundButton(
                    title: "略過",
                    buttonColor: Color(0xff000000),
                    onPress: () {
                      controller.messages.add(
                        PianoAnalysisChatModel(
                          content: "User skipped score name input.",
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
                    title: "重新上傳",
                    buttonColor: Colors.grey,
                    onPress: () {
                      // Reset states to step 0
                      controller.uploadCompleted.value = false;
                      controller.sheetMusicHandled.value = false;
                      controller.currentStep.value = 0;
                      controller.messages.clear();
                      // Optionally reinitialize first message
                      Future.delayed(Duration(milliseconds: 300), () {
                        controller.messages.add(
                          PianoAnalysisChatModel(
                            content:
                            "歡迎您，如果您準備好了，可以隨時上傳你的音頻或視頻，我會進行下一步分析。,     意音頻愈長，分析時間會愈久。",
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
                    CircularProgressIndicator(), // Show typing loader
                    SizedBox(height: 10),
                  ],
                  RoundButton(
                    title: "查看報告",
                    buttonColor: AppColor.prymaryTextColor,
                    onPress:
                    controller.isAnalyzing.value
                        ? null // Disable while loading
                        : () {
                      // Go to report page
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
                    title: "查看報告",
                    onPress: () {
                      //Get.to(() => ChatReportView(), binding: ReportBinding());
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
