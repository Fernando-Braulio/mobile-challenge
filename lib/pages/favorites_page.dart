import 'package:flutter/material.dart';
import 'package:mobile_challenge/db/database.dart';

class FavoritesPage extends StatefulWidget {
  final AppDatabase? db;
  const FavoritesPage({Key? key, this.db}) : super(key: key);

  @override
  _FavoritesPageState createState() => _FavoritesPageState();
}

class _FavoritesPageState extends State<FavoritesPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Usuários Favoritos"),
      ),
    );
  }
}
