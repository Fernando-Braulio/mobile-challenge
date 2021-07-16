import 'package:flutter/material.dart';
import 'package:mobile_challenge/db/database.dart';
import 'package:mobile_challenge/models/favorites.dart';

class FavoritesPage extends StatefulWidget {
  final AppDatabase db;
  const FavoritesPage({Key? key, required this.db}) : super(key: key);

  @override
  _FavoritesPageState createState() => _FavoritesPageState();
}

class _FavoritesPageState extends State<FavoritesPage> {
  @override
  void initState() {
    super.initState();
    GetFavorites();
  }

  Future<List<Favorites>> GetFavorites() {
    return widget.db.favoritesRepositoryDao.getAll();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Usuários Favoritos",
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Color(0xff000000),
        centerTitle: true,
        elevation: 0,
      ),
      body: FutureBuilder<List<Favorites>>(
        future: GetFavorites(),
        builder: (context, snapshot) {
          return snapshot.hasData
              ? snapshot.data!.length != 0
                  ? ListView.builder(
                      itemCount: snapshot.data!.length,
                      itemBuilder: (context, index) {
                        return Card(
                          child: ListTile(
                            leading: CircleAvatar(
                              backgroundImage: NetworkImage(
                                  snapshot.data![index].avatarUrl!),
                              backgroundColor: Colors.transparent,
                            ),
                            title: Text(snapshot.data![index].login!),
                            trailing: IconButton(
                              icon: Icon(
                                Icons.favorite,
                                color: Colors.red,
                              ),
                              onPressed: () {
                                var deletou = widget.db.favoritesRepositoryDao
                                    .deleteItem(snapshot.data![index]);

                                setState(() {
                                  GetFavorites();
                                });
                              },
                            ),
                          ),
                        );
                      },
                    )
                  : Center(
                      child: Text(
                        "Não há favoritos...",
                        style: TextStyle(fontSize: 24),
                      ),
                    )
              : Center(
                  child: Text(
                    "Não há favoritos...",
                    style: TextStyle(fontSize: 24),
                  ),
                );
        },
      ),
    );
  }
}
