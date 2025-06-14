class ViolinAnalysisChatModel {
  final String content;
  final String audio;
  final String video;
  final bool isSender;
  final bool isLoading; // ✅ Add this

  ViolinAnalysisChatModel({
    required this.content,
    required this.audio,
    required this.video,
    required this.isSender,
    this.isLoading = false, // default false
  });
}
