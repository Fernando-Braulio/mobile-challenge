import 'package:flutter/material.dart';
import 'package:mobile_challenge/db/database.dart';
import 'package:mobile_challenge/pages/initial_search_page.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(
    MaterialApp(
      home: InitialSearchPage(
        db: await $FloorAppDatabase.databaseBuilder('app_database.db').build(),
      ),
      title: "Challenge GitHub",
      debugShowCheckedModeBanner: false,
    ),
  );
}
