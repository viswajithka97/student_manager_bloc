import 'package:hive_flutter/hive_flutter.dart';
part 'db_model.g.dart';

@HiveType(typeId: 1)
class StudentModel {
  StudentModel(
      {required this.name,
      required this.age,
      required this.phone,
      required this.domain,
       this.image
      });

  @HiveField(0)
  final String name;
  @HiveField(1)
  final String age;
  @HiveField(2)
  final String phone;
  @HiveField(3)
  final String domain;
  @HiveField(4)
  final String? image;
}
