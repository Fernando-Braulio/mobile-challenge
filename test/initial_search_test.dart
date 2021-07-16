import 'package:flutter_test/flutter_test.dart';
import 'package:mobile_challenge/db/database.dart';

main() {
  late AppDatabase db;

  setUp(() async {
    db = await $FloorAppDatabase.databaseBuilder('app_database.db').build();
  });

  group("Initial Search Test", () {
    test("Empty list DB", () async {
      final listaFavorites = await db.favoritesRepositoryDao.getAll();
      expect(listaFavorites.length, 0);
    });
  });
}
