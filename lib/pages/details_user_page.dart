import 'package:flutter/material.dart';
import 'package:mobile_challenge/models/detailsUser.dart';
import 'package:mobile_challenge/repository/users_repository.dart';

class DetailsUserPage extends StatefulWidget {
  String username;
  DetailsUserPage({Key? key, required this.username}) : super(key: key);

  @override
  _DetailsUserPageState createState() => _DetailsUserPageState();
}

class _DetailsUserPageState extends State<DetailsUserPage> {
  late Future<DetailsUser> futureUser;

  @override
  void initState() {
    super.initState();
    futureUser = getUser(widget.username);
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: FutureBuilder<DetailsUser>(
        future: getUser(widget.username),
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
                      valueColor: AlwaysStoppedAnimation<Color>(Colors.black),
                      strokeWidth: 5.0,
                    ),
                  ],
                ),
              );
            default:
              if (snapshot.hasError)
                return Scaffold(
                  appBar: AppBar(
                    title: Text(
                      widget.username,
                      style: TextStyle(color: Colors.white),
                    ),
                    backgroundColor: Color(0xff000000),
                    centerTitle: true,
                    elevation: 0,
                  ),
                  body: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10.0),
                        child: Text(
                          'Ocorreu um erro! Favor tente novamente mais tarde.',
                          style: TextStyle(fontSize: 24),
                        ),
                      ),
                    ],
                  ),
                );
              else
                return Scaffold(
                  body: SafeArea(
                    child: Column(
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            image: DecorationImage(
                                image: NetworkImage(
                                    "https://i2.wp.com/www.multarte.com.br/wp-content/uploads/2018/12/fundo-cinza-claro18-1024x683.jpg?resize=696%2C464&ssl=1"),
                                fit: BoxFit.cover),
                          ),
                          child: Column(
                            children: [
                              Container(
                                alignment: Alignment.topRight,
                                child: Padding(
                                  padding: const EdgeInsets.all(15.0),
                                  child: Icon(
                                    Icons.favorite,
                                    color: Colors.grey,
                                  ),
                                ),
                              ),
                              Container(
                                width: double.infinity,
                                height: 160,
                                child: Container(
                                  alignment: Alignment(0.0, 2.5),
                                  child: CircleAvatar(
                                    backgroundImage:
                                        NetworkImage(snapshot.data!.avatarUrl!),
                                    radius: 60.0,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 60,
                        ),
                        Text(
                          snapshot.data!.name == null
                              ? snapshot.data!.login
                              : snapshot.data!.name!,
                          style: TextStyle(
                              fontSize: 25.0,
                              color: Colors.blueGrey,
                              letterSpacing: 2.0,
                              fontWeight: FontWeight.w400),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          snapshot.data!.location == null
                              ? ""
                              : snapshot.data!.location!,
                          style: TextStyle(
                              fontSize: 18.0,
                              color: Colors.black45,
                              letterSpacing: 2.0,
                              fontWeight: FontWeight.w300),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10.0),
                          child: Text(
                            snapshot.data!.bio == null
                                ? ""
                                : snapshot.data!.bio!,
                            style: TextStyle(
                                fontSize: 12.0,
                                color: Colors.black,
                                letterSpacing: 2.0,
                                fontWeight: FontWeight.w300),
                          ),
                        ),
                        SizedBox(
                          height: 30,
                        ),
                        Card(
                          margin: EdgeInsets.symmetric(
                              horizontal: 20.0, vertical: 8.0),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Expanded(
                                  child: Column(
                                    children: [
                                      Text(
                                        "Seguidores",
                                        style: TextStyle(
                                            color: Colors.blueAccent,
                                            fontSize: 22.0,
                                            fontWeight: FontWeight.w600),
                                      ),
                                      SizedBox(
                                        height: 7,
                                      ),
                                      Text(
                                        snapshot.data!.followers.toString(),
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 22.0,
                                            fontWeight: FontWeight.w300),
                                      )
                                    ],
                                  ),
                                ),
                                Expanded(
                                  child: Column(
                                    children: [
                                      Text(
                                        "Seguindo",
                                        style: TextStyle(
                                            color: Colors.blueAccent,
                                            fontSize: 22.0,
                                            fontWeight: FontWeight.w600),
                                      ),
                                      SizedBox(
                                        height: 7,
                                      ),
                                      Text(
                                        snapshot.data!.following.toString(),
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 22.0,
                                            fontWeight: FontWeight.w300),
                                      )
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10.0),
                          child: Row(
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Nickname: ${snapshot.data!.login}",
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 12.0,
                                        fontWeight: FontWeight.w600),
                                  ),
                                  Text(
                                    "E-mail: ${snapshot.data!.email == null ? "" : snapshot.data!.email}",
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 12.0,
                                        fontWeight: FontWeight.w600),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                );
          }
        },
      ),
    );
  }
}
