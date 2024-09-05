class Inbox {
  String text;
  String description;
  String date;
  bool isRead;

  Inbox({
    required this.text,
    required this.description,
    required this.date,
    this.isRead = false,
  });
}
