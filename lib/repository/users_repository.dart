import 'package:dio/dio.dart';
import 'package:mobile_challenge/models/detailsUser.dart';
import 'package:mobile_challenge/models/user.dart';

Future<List<User>> getUsers(String username) async {
  try {
    Dio dio = new Dio();
    Response response =
        await Dio().get('https://api.github.com/search/users?q=${username}');

    var listUsers = (response.data["items"] as List).map((e) {
      return User.fromJson(e);
    }).toList();

    return listUsers;
  } on DioError catch (e) {
    print(e);
    throw e.message;
  }
}

Future<DetailsUser> getUser(String username) async {
  try {
    Dio dio = new Dio();
    Response response =
        await Dio().get('https://api.github.com/users/${username}');

    return DetailsUser.fromJson(response.data);
  } on DioError catch (e) {
    print(e);
    throw e.message;
  }
}
