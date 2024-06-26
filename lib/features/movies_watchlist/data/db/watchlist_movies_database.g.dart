// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'watchlist_movies_database.dart';

// **************************************************************************
// FloorGenerator
// **************************************************************************

// ignore: avoid_classes_with_only_static_members
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

  WatchlistMovieDao? _watchlistMovieDaoInstance;

  Future<sqflite.Database> open(
    String path,
    List<Migration> migrations, [
    Callback? callback,
  ]) async {
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
            'CREATE TABLE IF NOT EXISTS `watchlist` (`id` INTEGER NOT NULL, `title` TEXT, `posterPath` TEXT, `releaseDate` TEXT, `tagline` TEXT, PRIMARY KEY (`id`))');

        await callback?.onCreate?.call(database, version);
      },
    );
    return sqfliteDatabaseFactory.openDatabase(path, options: databaseOptions);
  }

  @override
  WatchlistMovieDao get watchlistMovieDao {
    return _watchlistMovieDaoInstance ??=
        _$WatchlistMovieDao(database, changeListener);
  }
}

class _$WatchlistMovieDao extends WatchlistMovieDao {
  _$WatchlistMovieDao(
    this.database,
    this.changeListener,
  )   : _queryAdapter = QueryAdapter(database, changeListener),
        _watchlistMovieEntityInsertionAdapter = InsertionAdapter(
            database,
            'watchlist',
            (WatchlistMovieEntity item) => <String, Object?>{
                  'id': item.id,
                  'title': item.title,
                  'posterPath': item.posterPath,
                  'releaseDate': item.releaseDate,
                  'tagline': item.tagline
                },
            changeListener);

  final sqflite.DatabaseExecutor database;

  final StreamController<String> changeListener;

  final QueryAdapter _queryAdapter;

  final InsertionAdapter<WatchlistMovieEntity>
      _watchlistMovieEntityInsertionAdapter;

  @override
  Stream<List<WatchlistMovieEntity>> findAllWatchlistMovies() {
    return _queryAdapter.queryListStream('SELECT * FROM watchlist',
        mapper: (Map<String, Object?> row) => WatchlistMovieEntity(
            id: row['id'] as int,
            title: row['title'] as String?,
            posterPath: row['posterPath'] as String?,
            releaseDate: row['releaseDate'] as String?,
            tagline: row['tagline'] as String?),
        queryableName: 'watchlist',
        isView: false);
  }

  @override
  Stream<WatchlistMovieEntity?> findWatchlistMovieById(int id) {
    return _queryAdapter.queryStream('SELECT * FROM watchlist WHERE id = ?1',
        mapper: (Map<String, Object?> row) => WatchlistMovieEntity(
            id: row['id'] as int,
            title: row['title'] as String?,
            posterPath: row['posterPath'] as String?,
            releaseDate: row['releaseDate'] as String?,
            tagline: row['tagline'] as String?),
        arguments: [id],
        queryableName: 'watchlist',
        isView: false);
  }

  @override
  Future<void> deleteWatchlistMovieById(int id) async {
    await _queryAdapter
        .queryNoReturn('DELETE FROM watchlist WHERE id = ?1', arguments: [id]);
  }

  @override
  Future<void> insertWatchlistMovie(WatchlistMovieEntity watchlistMovie) async {
    await _watchlistMovieEntityInsertionAdapter.insert(
        watchlistMovie, OnConflictStrategy.abort);
  }
}
