import 'package:floor/floor.dart';

@entity
class Favorites {
  Favorites({required this.id, this.createdAt, this.avatarUrl, this.login});

  @PrimaryKey(autoGenerate: true)
  final int id;

  final String? createdAt;
  final String? avatarUrl;
  final String? login;
}
