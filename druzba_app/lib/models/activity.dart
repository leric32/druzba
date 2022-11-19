// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class Activity {
  int idA;
  String title;
  String type;
  String description;
  int num_of_people;
  String meeting_point;
  String time;
  int duration;
  int max_people;
  int min_people;
  String user_founder;
  Activity({
    required this.idA,
    required this.title,
    required this.type,
    required this.description,
    required this.num_of_people,
    required this.meeting_point,
    required this.time,
    required this.duration,
    required this.max_people,
    required this.min_people,
    required this.user_founder,
  });

  Activity copyWith({
    int? idA,
    String? title,
    String? type,
    String? description,
    int? num_of_people,
    String? meeting_point,
    String? time,
    int? duration,
    int? max_people,
    int? min_people,
    String? user_founder,
  }) {
    return Activity(
      idA: idA ?? this.idA,
      title: title ?? this.title,
      type: type ?? this.type,
      description: description ?? this.description,
      num_of_people: num_of_people ?? this.num_of_people,
      meeting_point: meeting_point ?? this.meeting_point,
      time: time ?? this.time,
      duration: duration ?? this.duration,
      max_people: max_people ?? this.max_people,
      min_people: min_people ?? this.min_people,
      user_founder: user_founder ?? this.user_founder,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'idA': idA,
      'title': title,
      'type': type,
      'description': description,
      'num_of_people': num_of_people,
      'meeting_point': meeting_point,
      'time': time,
      'duration': duration,
      'max_people': max_people,
      'min_people': min_people,
      'user_founder': user_founder,
    };
  }

  factory Activity.fromMap(Map<String, dynamic> map) {
    return Activity(
      idA: map['idA'] as int,
      title: map['title'] as String,
      type: map['type'] as String,
      description: map['description'] as String,
      num_of_people: map['num_of_people'] as int,
      meeting_point: map['meeting_point'] as String,
      time: map['time'] as String,
      duration: map['duration'] as int,
      max_people: map['max_people'] as int,
      min_people: map['min_people'] as int,
      user_founder: map['user_founder'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory Activity.fromJson(String source) =>
      Activity.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'Activity(idA: $idA, title: $title, type: $type, description: $description, num_of_people: $num_of_people, meeting_point: $meeting_point, time: $time, duration: $duration, max_people: $max_people, min_people: $min_people, user_founder: $user_founder)';
  }

  @override
  bool operator ==(covariant Activity other) {
    if (identical(this, other)) return true;

    return other.idA == idA &&
        other.title == title &&
        other.type == type &&
        other.description == description &&
        other.num_of_people == num_of_people &&
        other.meeting_point == meeting_point &&
        other.time == time &&
        other.duration == duration &&
        other.max_people == max_people &&
        other.min_people == min_people &&
        other.user_founder == user_founder;
  }

  @override
  int get hashCode {
    return idA.hashCode ^
        title.hashCode ^
        type.hashCode ^
        description.hashCode ^
        num_of_people.hashCode ^
        meeting_point.hashCode ^
        time.hashCode ^
        duration.hashCode ^
        max_people.hashCode ^
        min_people.hashCode ^
        user_founder.hashCode;
  }
}
