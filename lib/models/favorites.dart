import 'package:floor/floor.dart';

@entity
class Favorites {
  Favorites({this.id, this.createdAt, this.avatarUrl, this.login});

  @PrimaryKey(autoGenerate: true)
  late int? id;

  final String? createdAt;
  final String? avatarUrl;
  final String? login;
}
