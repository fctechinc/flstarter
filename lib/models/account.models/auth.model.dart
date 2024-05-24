import 'dart:convert';

class Auth {
  final String token;
  final String type;
  final DateTime exp;
  final DateTime fetchedAt;

  Auth({
    required this.token,
    required this.type,
    required this.exp,
    required this.fetchedAt,
  });

  Auth copyWith({
    String? token,
    String? type,
    DateTime? exp,
  }) =>
      Auth(
        token: token ?? this.token,
        type: type ?? this.type,
        exp: exp ?? this.exp,
        fetchedAt: fetchedAt,
      );

  factory Auth.fromRawJson(String str) => Auth.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Auth.fromJson(Map<String, dynamic> json) => Auth(
        token: json["token"],
        type: json["type"],
        exp: DateTime.parse(json["exp"]),
        fetchedAt: DateTime.now(),
      );

  Map<String, dynamic> toJson() => {
        "token": token,
        "type": type,
        "exp": exp.toIso8601String(),
      };
}
