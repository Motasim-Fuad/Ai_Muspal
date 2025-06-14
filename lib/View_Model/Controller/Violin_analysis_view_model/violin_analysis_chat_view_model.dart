import 'dart:io';

import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';
import 'package:image_picker/image_picker.dart';
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

  //music sheed

  Future<void> pickSheetMusic() async {
    final pickedFile = await FilePicker.platform.pickFiles(
      type: FileType.image,
    ); // or PDF
    if (pickedFile != null) {
      final file = File(pickedFile.files.single.path!);
      sheetMusicHandled.value = true;

      // 1. Add user's upload message
      messages.add(
        ViolinAnalysisChatModel(
          content: '使用者上傳了樂譜。',
          audio: '',
          video: '',
          isSender: true,
        ),
      );

      // ✅ Show loading state
      isAnalyzing.value = true;

      // 2. Simulate analysis delay
      await Future.delayed(Duration(seconds: 5)); // Replace with real API call

      // 3. Add bot response
      messages.add(
        ViolinAnalysisChatModel(
          content: '分析完成！您可以查看分析報告。',
          audio: '',
          video: '',
          isSender: false,
        ),
      );

      // ✅ Hide loading state
      isAnalyzing.value = false;

      // ✅ Move to report view step
      currentStep.value = 4;
    }
  }

  /// Store score name and send a message to the chat
  void addScoreName(String name) {
    scoreName.value = name;
    messages.add(
      ViolinAnalysisChatModel(
        content: "Score Name: $name",
        audio: '',
        video: '',
        isSender: true,
      ),
    );

    // ✅ Show loading state
    isAnalyzing.value = true;

    Future.delayed(Duration(seconds: 5), () {
      messages.add(
        ViolinAnalysisChatModel(
          content: "Bot received the score name.$name",
          audio: '',
          video: '',
          isSender: false,
        ),
      );
    });

    isAnalyzing.value = false;
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

      // Mark upload as completed
      uploadCompleted.value = true;

      Future.delayed(Duration(seconds: 5), () {
        messages.add(
          ViolinAnalysisChatModel(
            content: "Bot received your $type file.",
            audio: '',
            video: '',
            isSender: false,
          ),
        );
      });
    }
  }
}
