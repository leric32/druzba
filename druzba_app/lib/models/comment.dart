// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class Comment {
  String desc;
  String autor;
  Comment({required this.desc, required this.autor});

  Comment copyWith({
    String? desc,
    String? autor,
  }) {
    return Comment(
      desc: desc ?? this.desc,
      autor: autor ?? this.autor,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'desc': desc,
      'autor': autor,
    };
  }

  factory Comment.fromMap(Map<String, dynamic> map) {
    return Comment(
      desc: map['desc'] as String,
      autor: map['autor'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory Comment.fromJson(String source) =>
      Comment.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'Comment(desc: $desc, autor: $autor)';

  @override
  bool operator ==(covariant Comment other) {
    if (identical(this, other)) return true;

    return other.desc == desc && other.autor == autor;
  }

  @override
  int get hashCode => desc.hashCode ^ autor.hashCode;
}
