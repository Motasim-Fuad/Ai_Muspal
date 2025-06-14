class ChatReportModel {
  final int totalScore;
  final int pitchScore;
  final int rhythmScore;
  final int dynamicsScore;
  final String overallComment;

  ChatReportModel({
    required this.totalScore,
    required this.pitchScore,
    required this.rhythmScore,
    required this.dynamicsScore,
    required this.overallComment,
  });
}