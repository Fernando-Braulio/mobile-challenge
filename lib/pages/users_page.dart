import 'package:flutter/material.dart';
import 'package:mobile_challenge/db/database.dart';
// import 'package:flutter_statusbarcolor/flutter_statusbarcolor.dart';
import 'package:mobile_challenge/models/user.dart';
import 'package:mobile_challenge/pages/details_user_page.dart';
import 'package:mobile_challenge/pages/initial_search_page.dart';
import 'package:mobile_challenge/repository/users_repository.dart';

class UsersPage extends StatefulWidget {
  String username;
  final AppDatabase? db;

  UsersPage({Key? key, required this.username, this.db}) : super(key: key);

  @override
  _UsersPageState createState() => _UsersPageState();
}

class _UsersPageState extends State<UsersPage> {
  late Future<List<User>> futureUsers;

  @override
  void initState() {
    super.initState();
    futureUsers = getUsers(widget.username);
  }

  @override
  Widget build(BuildContext context) {
    // FlutterStatusbarcolor.setStatusBarColor(Colors.white);
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Resultado: ${widget.username}",
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Color(0xff000000),
        centerTitle: true,
        elevation: 0,
        actions: [
          IconButton(
            onPressed: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) => InitialSearchPage(),
                ),
              );
            },
            icon: Icon(Icons.search),
          ),
        ],
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            child: FutureBuilder(
              future: getUsers(widget.username),
              builder: (context, snapshot) {
                switch (snapshot.connectionState) {
                  case ConnectionState.waiting:
                  case ConnectionState.none:
                    return Container(
                      height: MediaQuery.of(context).size.height,
                      width: MediaQuery.of(context).size.width,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          CircularProgressIndicator(
                            valueColor:
                                AlwaysStoppedAnimation<Color>(Colors.black),
                            strokeWidth: 5.0,
                          ),
                        ],
                      ),
                    );
                  default:
                    if (snapshot.hasError)
                      return Container();
                    else
                      return ListView.builder(
                        itemCount: snapshot.data.length,
                        itemBuilder: (context, index) {
                          return Card(
                            child: InkWell(
                              child: ListTile(
                                leading: CircleAvatar(
                                  backgroundImage: NetworkImage(
                                      snapshot.data[index].avatarUrl),
                                  backgroundColor: Colors.transparent,
                                ),
                                title: Text(snapshot.data[index].login),
                                trailing: Icon(Icons.favorite),
                              ),
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => DetailsUserPage(
                                      username: snapshot.data[index].login,
                                    ),
                                  ),
                                );
                              },
                            ),
                          );
                        },
                      );
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}
