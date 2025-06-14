
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:file_picker/file_picker.dart';
import '../../../models/music_chat/chat_message.dart';


class MusicChatViewModel extends GetxController {

  // Store pending file preview
  var pendingAttachmentPath = ''.obs;
  var pendingAttachmentType = Rxn<ChatMessageType>();

  final TextEditingController messageController = TextEditingController();
  var chatMessages = <ChatMessage>[].obs;
  var isBotTyping = false.obs;

  var isInputNotEmpty = false.obs;

//massage limitation
  var dailyMessageLimit = 3;
  var messagesSentToday = 0.obs;
  var hasReachedLimit = false.obs;
  // Simulate user type
  bool isPremiumUser = false; // Ideally fetch this from user profile or settings

  @override
  void onInit() {
    super.onInit();
    // Initialize with sample data
    chatMessages.assignAll([
      ChatMessage(
        text: "Hi Sajol,",
        messageType: ChatMessageType.text,
        messageStatus: MessageStatus.viewed,
        isSender: false,
      ),
      ChatMessage(
        text: "Hello, How are you?",
        messageType: ChatMessageType.text,
        messageStatus: MessageStatus.viewed,
        isSender: true,
      ),
      ChatMessage(
        text: "",
        messageType: ChatMessageType.audio,
        messageStatus: MessageStatus.viewed,
        isSender: false,
      ),
      ChatMessage(
        text: "yes",
        messageType: ChatMessageType.text,
        messageStatus: MessageStatus.viewed,
        isSender: true,
      ),
      ChatMessage(
        text: "Error happened",
        messageType: ChatMessageType.text,
        messageStatus: MessageStatus.notSent,
        isSender: true,
      ),
      ChatMessage(
        text: "This looks great man!!",
        messageType: ChatMessageType.text,
        messageStatus: MessageStatus.viewed,
        isSender: false,
      ),
      ChatMessage(
        text: "Glad you like it",
        messageType: ChatMessageType.text,
        messageStatus: MessageStatus.notView,
        isSender: true,
      ),
    ]);
  }





  void sendMessage() {

    if (!isPremiumUser && messagesSentToday.value >= dailyMessageLimit) {
      hasReachedLimit.value = true;
     // Utils.snackBar("no limit", "please subscribe");
      // Optionally show a toast or other alert
      return;
    }


    final text = messageController.text.trim();
    final hasAttachment = pendingAttachmentPath.value.isNotEmpty;

    print("Sending message: $text");
    print("Has attachment: $hasAttachment");

    if (text.isNotEmpty || hasAttachment) {
      final message = ChatMessage(
        text: text,
        attachmentPath: hasAttachment ? pendingAttachmentPath.value : null,
        messageType: hasAttachment ? pendingAttachmentType.value! : ChatMessageType.text,
        messageStatus: MessageStatus.notView,
        isSender: true,
      );

      chatMessages.add(message);
      messageController.clear();
      isInputNotEmpty.value = false; // clear input state
      pendingAttachmentPath.value = '';
      pendingAttachmentType.value = null;

      messagesSentToday.value++; // Increment message count





      isBotTyping.value = true;
      Future.delayed(const Duration(seconds: 2), () {
        isBotTyping.value = false;
        chatMessages.add(ChatMessage(
          text: "Bot reply to: ${text.isNotEmpty ? text : 'file'}",
          messageType: ChatMessageType.text,
          messageStatus: MessageStatus.viewed,
          isSender: false,
        ));





      });
    }
  }







  Future<void> pickImageFromCamera() async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.camera);
    if (pickedFile != null) {
      pendingAttachmentPath.value = pickedFile.path;
      pendingAttachmentType.value = ChatMessageType.image;
    }
  }

  Future<void> pickImageFromGallery() async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      pendingAttachmentPath.value = pickedFile.path;
      pendingAttachmentType.value = ChatMessageType.image;
    }
  }

  Future<void> pickFile() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles();
    if (result != null && result.files.single.path != null) {
      final path = result.files.single.path!;
      final extension = path.split('.').last.toLowerCase();

      ChatMessageType fileType;
      if (extension == 'pdf') {
        fileType = ChatMessageType.pdf;
      } else if (extension == 'doc' || extension == 'docx') {
        fileType = ChatMessageType.doc;
      } else {
        fileType = ChatMessageType.file;
      }

      pendingAttachmentPath.value = path;
      pendingAttachmentType.value = fileType;
    }
  }







}