// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'database.dart';

// **************************************************************************
// FloorGenerator
// **************************************************************************

class $FloorAppDatabase {
  /// Creates a database builder for a persistent database.
  /// Once a database is built, you should keep a reference to it and re-use it.
  static _$AppDatabaseBuilder databaseBuilder(String name) =>
      _$AppDatabaseBuilder(name);

  /// Creates a database builder for an in memory database.
  /// Information stored in an in memory database disappears when the process is killed.
  /// Once a database is built, you should keep a reference to it and re-use it.
  static _$AppDatabaseBuilder inMemoryDatabaseBuilder() =>
      _$AppDatabaseBuilder(null);
}

class _$AppDatabaseBuilder {
  _$AppDatabaseBuilder(this.name);

  final String? name;

  final List<Migration> _migrations = [];

  Callback? _callback;

  /// Adds migrations to the builder.
  _$AppDatabaseBuilder addMigrations(List<Migration> migrations) {
    _migrations.addAll(migrations);
    return this;
  }

  /// Adds a database [Callback] to the builder.
  _$AppDatabaseBuilder addCallback(Callback callback) {
    _callback = callback;
    return this;
  }

  /// Creates the database and initializes it.
  Future<AppDatabase> build() async {
    final path = name != null
        ? await sqfliteDatabaseFactory.getDatabasePath(name!)
        : ':memory:';
    final database = _$AppDatabase();
    database.database = await database.open(
      path,
      _migrations,
      _callback,
    );
    return database;
  }
}

class _$AppDatabase extends AppDatabase {
  _$AppDatabase([StreamController<String>? listener]) {
    changeListener = listener ?? StreamController<String>.broadcast();
  }

  FavoritesRepositoryDao? _favoritesRepositoryDaoInstance;

  Future<sqflite.Database> open(String path, List<Migration> migrations,
      [Callback? callback]) async {
    final databaseOptions = sqflite.OpenDatabaseOptions(
      version: 1,
      onConfigure: (database) async {
        await database.execute('PRAGMA foreign_keys = ON');
        await callback?.onConfigure?.call(database);
      },
      onOpen: (database) async {
        await callback?.onOpen?.call(database);
      },
      onUpgrade: (database, startVersion, endVersion) async {
        await MigrationAdapter.runMigrations(
            database, startVersion, endVersion, migrations);

        await callback?.onUpgrade?.call(database, startVersion, endVersion);
      },
      onCreate: (database, version) async {
        await database.execute(
            'CREATE TABLE IF NOT EXISTS `Favorites` (`id` INTEGER PRIMARY KEY AUTOINCREMENT, `createdAt` TEXT, `avatarUrl` TEXT, `login` TEXT)');

        await callback?.onCreate?.call(database, version);
      },
    );
    return sqfliteDatabaseFactory.openDatabase(path, options: databaseOptions);
  }

  @override
  FavoritesRepositoryDao get favoritesRepositoryDao {
    return _favoritesRepositoryDaoInstance ??=
        _$FavoritesRepositoryDao(database, changeListener);
  }
}

class _$FavoritesRepositoryDao extends FavoritesRepositoryDao {
  _$FavoritesRepositoryDao(this.database, this.changeListener)
      : _queryAdapter = QueryAdapter(database),
        _favoritesInsertionAdapter = InsertionAdapter(
            database,
            'Favorites',
            (Favorites item) => <String, Object?>{
                  'id': item.id,
                  'createdAt': item.createdAt,
                  'avatarUrl': item.avatarUrl,
                  'login': item.login
                }),
        _favoritesUpdateAdapter = UpdateAdapter(
            database,
            'Favorites',
            ['id'],
            (Favorites item) => <String, Object?>{
                  'id': item.id,
                  'createdAt': item.createdAt,
                  'avatarUrl': item.avatarUrl,
                  'login': item.login
                }),
        _favoritesDeletionAdapter = DeletionAdapter(
            database,
            'Favorites',
            ['id'],
            (Favorites item) => <String, Object?>{
                  'id': item.id,
                  'createdAt': item.createdAt,
                  'avatarUrl': item.avatarUrl,
                  'login': item.login
                });

  final sqflite.DatabaseExecutor database;

  final StreamController<String> changeListener;

  final QueryAdapter _queryAdapter;

  final InsertionAdapter<Favorites> _favoritesInsertionAdapter;

  final UpdateAdapter<Favorites> _favoritesUpdateAdapter;

  final DeletionAdapter<Favorites> _favoritesDeletionAdapter;

  @override
  Future<List<Favorites>> getAll() async {
    return _queryAdapter.queryList('SELECT * FROM Favorites',
        mapper: (Map<String, Object?> row) => Favorites(
            id: row['id'] as int?,
            createdAt: row['createdAt'] as String?,
            avatarUrl: row['avatarUrl'] as String?,
            login: row['login'] as String?));
  }

  @override
  Future<Favorites?> getById(int id) async {
    return _queryAdapter.query(
        'SELECT * FROM Favorites WHERE id is not null and id = ?1',
        mapper: (Map<String, Object?> row) => Favorites(
            id: row['id'] as int?,
            createdAt: row['createdAt'] as String?,
            avatarUrl: row['avatarUrl'] as String?,
            login: row['login'] as String?),
        arguments: [id]);
  }

  @override
  Future<Favorites?> getFavoriteLogin(String login) async {
    return _queryAdapter.query('SELECT * FROM Favorites WHERE login = ?1',
        mapper: (Map<String, Object?> row) => Favorites(
            id: row['id'] as int?,
            createdAt: row['createdAt'] as String?,
            avatarUrl: row['avatarUrl'] as String?,
            login: row['login'] as String?),
        arguments: [login]);
  }

  @override
  Future<int> insertItem(Favorites item) {
    return _favoritesInsertionAdapter.insertAndReturnId(
        item, OnConflictStrategy.abort);
  }

  @override
  Future<int> updateitem(Favorites item) {
    return _favoritesUpdateAdapter.updateAndReturnChangedRows(
        item, OnConflictStrategy.abort);
  }

  @override
  Future<int> deleteItem(Favorites item) {
    return _favoritesDeletionAdapter.deleteAndReturnChangedRows(item);
  }
}
