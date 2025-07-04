import 'dart:io';

import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';
import '../../../models/analysis_model/piano_analysis_chat_model.dart';
import '../../../models/analysis_model/violin_analysis__chat_model.dart';

class PianoAnalysisChatViewModel extends GetxController {
  var messages = <PianoAnalysisChatModel>[].obs;
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
        PianoAnalysisChatModel(
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
          PianoAnalysisChatModel(
            content: "bot_response_prefix".trParams({"msg": text}),
            audio: '',
            video: '',
            isSender: false,
          ),
        );
      });
    }
  }

  // Music sheet picker
  Future<void> pickSheetMusic() async {
    final pickedFile = await FilePicker.platform.pickFiles(
      type: FileType.image,
    ); // or PDF
    if (pickedFile != null) {
      final file = File(pickedFile.files.single.path!);
      sheetMusicHandled.value = true;

      // 1. Add user's upload message
      messages.add(
        PianoAnalysisChatModel(
          content: 'user_uploaded_sheet_music'.tr,
          audio: '',
          video: '',
          isSender: true,
        ),
      );

      // Show loading state
      isAnalyzing.value = true;

      // 2. Simulate analysis delay (replace with API call)
      await Future.delayed(Duration(seconds: 5));

      // 3. Add bot response
      messages.add(
        PianoAnalysisChatModel(
          content: 'analysis_complete'.tr,
          audio: '',
          video: '',
          isSender: false,
        ),
      );

      // Hide loading state
      isAnalyzing.value = false;

      // Move to report view step
      currentStep.value = 4;
    }
  }

  /// Store score name and send a message to the chat
  void addScoreName(String name) {
    scoreName.value = name;
    messages.add(
      PianoAnalysisChatModel(
        content: "score_name_label".trParams({"name": name}),
        audio: '',
        video: '',
        isSender: true,
      ),
    );

    // Show loading state
    isAnalyzing.value = true;

    Future.delayed(Duration(seconds: 5), () {
      messages.add(
        PianoAnalysisChatModel(
          content: "bot_received_score_name".trParams({"name": name}),
          audio: '',
          video: '',
          isSender: false,
        ),
      );

      isAnalyzing.value = false;
    });
  }

  /// Upload and send audio or video file
  Future<void> pickMedia(String type) async {
    FileType fileType = type == 'audio' ? FileType.audio : FileType.video;

    final result = await FilePicker.platform.pickFiles(type: fileType);

    if (result != null && result.files.single.path != null) {
      final filePath = result.files.single.path!;

      messages.add(
        PianoAnalysisChatModel(
          content: '',
          audio: type == 'audio' ? filePath : '',
          video: type == 'video' ? filePath : '',
          isSender: true,
        ),
      );

      uploadCompleted.value = true;

      Future.delayed(Duration(seconds: 5), () {
        messages.add(
          PianoAnalysisChatModel(
            content: "bot_received_file".trParams({"type": type}),
            audio: '',
            video: '',
            isSender: false,
          ),
        );
      });
    }
  }
}
