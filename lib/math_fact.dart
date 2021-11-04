class MathFact {
  String text;
  int number;
  bool found;
  String type;

  MathFact({
    required this.text,
    required this.number,
    required this.found,
    required this.type,
  });

  factory MathFact.fromJson(Map<String, dynamic> json) {
    return MathFact(
      text: json['text'] ?? 'no text',
      number: json['number'] ?? -1,
      found: json['found'] ?? false,
      type: json['type'] ?? 'no type',
    );
  }
}
