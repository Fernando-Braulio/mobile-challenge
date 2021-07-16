import 'package:floor/floor.dart';
import 'package:mobile_challenge/models/favorites.dart';

import 'interfaces/repository_dao_interface.dart';

@dao
abstract class FavoritesRepositoryDao
    extends IRepositoryDaoInterface<Favorites> {
  @Query('SELECT * FROM Favorites')
  Future<List<Favorites>> getAll();

  @Query('SELECT * FROM Favorites WHERE id is not null and id = :id')
  Future<Favorites?> getById(int id);
}
