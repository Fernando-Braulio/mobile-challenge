import 'package:flutter/material.dart';
import 'package:flutter_statusbarcolor/flutter_statusbarcolor.dart';
import 'home_page.dart';

class InitialSearchPage extends StatefulWidget {
  const InitialSearchPage({Key key}) : super(key: key);

  @override
  _InitialSearchPageState createState() => _InitialSearchPageState();
}

class _InitialSearchPageState extends State<InitialSearchPage> {
  TextEditingController _controller = TextEditingController();
  bool _validate = false;

  @override
  Widget build(BuildContext context) {
    FlutterStatusbarcolor.setStatusBarColor(Colors.transparent);
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        color: Colors.black,
        child: Padding(
          padding: EdgeInsets.all(20.0),
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(
                  height: 50.0,
                ),
                Container(
                  width: 80.0,
                  height: 80.0,
                  child: CircleAvatar(
                    backgroundImage: NetworkImage(
                        'https://icon-library.com/images/github-icon-png/github-icon-png-29.jpg'),
                    backgroundColor: Colors.transparent,
                  ),
                ),
                SizedBox(
                  height: 20.0,
                ),
                Text(
                  "Github",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 40,
                      fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 120.0,
                ),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.white.withOpacity(.1),
                  ),
                  child: TextField(
                    controller: _controller,
                    onChanged: (texto) {
                      setState(() {
                        _validate = texto.isEmpty;
                      });
                    },
                    style: TextStyle(color: Colors.white),
                    decoration: InputDecoration(
                      errorText:
                          _validate ? "Favor inserir um valor válido." : null,
                      border: InputBorder.none,
                      hintText: "Digite o usuário...",
                      hintStyle: TextStyle(color: Colors.grey),
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                MaterialButton(
                  padding: EdgeInsets.all(20),
                  color: Colors.blue,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Align(
                    child: Text(
                      'Buscar',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                  onPressed: () {
                    setState(() {
                      _validate = _controller.text.isEmpty;
                    });
                    if (_controller.text != '') {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => HomePage(
                            username: _controller.text,
                          ),
                        ),
                      );
                    }
                  },
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
