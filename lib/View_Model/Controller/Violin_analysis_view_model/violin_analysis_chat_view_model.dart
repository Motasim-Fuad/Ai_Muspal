import 'dart:io';

import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';
import '../../../models/analysis_model/violin_analysis__chat_model.dart';

class ViolinAnalysisChatViewModel extends GetxController {
  var messages = <ViolinAnalysisChatModel>[].obs;
  final textController = TextEditingController();
  var uploadCompleted = false.obs;
  var currentStep = 0.obs;
  var sheetMusicHandled = false.obs;
  var isAnalyzing = false.obs;
  var scoreName = ''.obs;

  /// Send a plain text message
  void sendTextMessage() {
    final text = textController.text.trim();
    if (text.isNotEmpty) {
      messages.add(
        ViolinAnalysisChatModel(
          content: text,
          audio: '',
          video: '',
          isSender: true,
        ),
      );
      textController.clear();

      // Simulated bot response
      Future.delayed(Duration(seconds: 1), () {
        messages.add(
          ViolinAnalysisChatModel(
            content: "Bot: $text",
            audio: '',
            video: '',
            isSender: false,
          ),
        );
      });
    }
  }

  /// Pick sheet music and simulate analysis
  Future<void> pickSheetMusic() async {
    final pickedFile = await FilePicker.platform.pickFiles(
      type: FileType.image,
    );
    if (pickedFile != null) {
      final file = File(pickedFile.files.single.path!);
      sheetMusicHandled.value = true;

      messages.add(
        ViolinAnalysisChatModel(
          content: 'violinChat_uploadScore'.tr,
          audio: '',
          video: '',
          isSender: true,
        ),
      );

      isAnalyzing.value = true;

      await Future.delayed(Duration(seconds: 5));

      messages.add(
        ViolinAnalysisChatModel(
          content: 'violinChat_viewReport'.tr,
          audio: '',
          video: '',
          isSender: false,
        ),
      );

      isAnalyzing.value = false;
      currentStep.value = 4;
    }
  }

  /// Store score name and send a message to the chat
  void addScoreName(String name) {
    scoreName.value = name;
    messages.add(
      ViolinAnalysisChatModel(
        content: "${'violinChat_scoreNameIs'.tr} $name",
        audio: '',
        video: '',
        isSender: true,
      ),
    );

    isAnalyzing.value = true;

    Future.delayed(Duration(seconds: 5), () {
      messages.add(
        ViolinAnalysisChatModel(
          content: "violinChat_analyzing".tr,
          audio: '',
          video: '',
          isSender: false,
        ),
      );

      isAnalyzing.value = false;
      currentStep.value = 4;
    });
  }

  /// Upload and send audio or video file
  Future<void> pickMedia(String type) async {
    FileType fileType = type == 'audio' ? FileType.audio : FileType.video;

    final result = await FilePicker.platform.pickFiles(type: fileType);

    if (result != null && result.files.single.path != null) {
      final filePath = result.files.single.path!;

      messages.add(
        ViolinAnalysisChatModel(
          content: '',
          audio: type == 'audio' ? filePath : '',
          video: type == 'video' ? filePath : '',
          isSender: true,
        ),
      );

      uploadCompleted.value = true;

      Future.delayed(Duration(seconds: 5), () {
        messages.add(
          ViolinAnalysisChatModel(
            content: "violinChat_${type}File".tr,
            audio: '',
            video: '',
            isSender: false,
          ),
        );
      });
    }
  }
}
