enum ChatMessageType {
  text,
  audio,
  image,
  pdf,
  doc,
  file, // generic fallback
}
enum MessageStatus { notSent, notView, viewed }

class ChatMessage {
  final String text; // Keep text
  final String? attachmentPath; // Add attachment path
  final ChatMessageType messageType;
  final MessageStatus messageStatus;
  final bool isSender;

  ChatMessage({
    required this.text,
    this.attachmentPath,
    required this.messageType,
    required this.messageStatus,
    required this.isSender,
  });
}
