class HerReply {
  final String answer;
  final bool forced;
  final String image;

  HerReply({
    required this.answer,
    required this.forced,
    required this.image,
  });

  factory HerReply.fromJson(Map<String, dynamic> json) => HerReply(
        answer: json["answer"],
        forced: json["forced"],
        image: json["image"],
      );

  Map<String, dynamic> toJson() => {
        "answer": answer,
        "forced": forced,
        "image": image,
      };
}
