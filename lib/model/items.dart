import 'package:hive/hive.dart';

part 'items.g.dart';

@HiveType(typeId: 0)
class Items extends HiveObject{

  @HiveField(0)
  late String title;

  @HiveField(1)
  late String region;

  @HiveField(2)
  late String room;

  @HiveField(3)
  late String type;

  @HiveField(4)
  late bool collected;

  @HiveField(5)
  late String description;

}