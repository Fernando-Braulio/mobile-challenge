import 'dart:async';
import 'package:floor/floor.dart';
import 'package:mobile_challenge/models/favorites.dart';
import 'package:mobile_challenge/repository/favorites_repository_dao.dart';
import 'package:sqflite/sqflite.dart' as sqflite;

part 'database.g.dart';

@Database(version: 1, entities: [Favorites])
abstract class AppDatabase extends FloorDatabase {
  FavoritesRepositoryDao get favoritesRepositoryDao;
}
