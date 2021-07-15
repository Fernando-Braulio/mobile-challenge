import 'package:flutter/material.dart';
import 'package:mobile_challenge/pages/favorites_page.dart';
import 'package:mobile_challenge/pages/initial_search_page.dart';
import 'package:mobile_challenge/pages/users_page.dart';

class HomePage extends StatefulWidget {
  String username;

  HomePage({Key key, this.username}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int paginaAtual = 0;
  PageController pageController;

  @override
  void initState() {
    super.initState();
    pageController = PageController(initialPage: paginaAtual);
  }

  setPaginaAtual(pagina) {
    setState(() {
      paginaAtual = pagina;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: pageController,
        children: [
          if (widget.username == null || widget.username == "")
            InitialSearchPage()
          else
            UsersPage(username: widget.username),
          FavoritesPage(),
        ],
        onPageChanged: setPaginaAtual,
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: paginaAtual,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.list), label: 'Todos'),
          BottomNavigationBarItem(
              icon: Icon(Icons.favorite), label: 'Favoritos'),
        ],
        onTap: (pagina) {
          pageController.animateToPage(
            pagina,
            duration: Duration(milliseconds: 400),
            curve: Curves.ease,
          );
        },
      ),
    );
  }
}
