import 'package:cloud_firestore/cloud_firestore.dart';

class Available {
  Available(
      this.tutor,
      {
        required this.date,
        this.done,
      });
  factory Available.fromJson(Map<String, dynamic> json) =>
      _availableFromJson(json);

  final String tutor;
  final DateTime date;
  bool? done;
  Map<String, dynamic> toJson() => _availableToJson(this);

  @override
  String toString() => 'Available<$tutor>';
}

Available _availableFromJson(Map<String, dynamic> json) {
  return Available(
    json['tutor'] as String,
    date: (json['date'] as Timestamp).toDate(),
    done: json['done'] as bool,
  );
}
// 2
Map<String, dynamic> _availableToJson(Available instance) =>
    <String, dynamic>{
      'tutor': instance.tutor,
      'date': instance.date,
      'done': instance.done,
    };
