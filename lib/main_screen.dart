import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import 'detail_page.dart';
import 'drawer.dart';
import 'json_data.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        appBarTheme: const AppBarTheme(backgroundColor: Color(0xFF03203e)),
      ),
      home: AllUsersPage(),
    );
  }
}

Future<List<User>> fetchUsers() async {
  final response =
  await http.get(Uri.parse('https://jsonplaceholder.typicode.com/users'));

  if (response.statusCode == 200) {
    return List<User>.from(
        jsonDecode(response.body).map((user) => User.fromJson(user)));
  } else {
    throw Exception('Failed to load users');
  }
}

class AllUsersPage extends StatefulWidget {
  const AllUsersPage({Key? key}) : super(key: key);

  @override
  _AllUsersPageState createState() => _AllUsersPageState();
}

class _AllUsersPageState extends State<AllUsersPage> {
  late Future<List<User>> futureUsers;

  @override
  void initState() {
    super.initState();
    futureUsers = fetchUsers();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Пользователи'),
      ),
      drawer: navDrawer(context),
      body: Center(
        child: FutureBuilder<List<User>>(
          future: futureUsers,
          builder: (BuildContext context, AsyncSnapshot<List<User>> snapshot) {
            if (snapshot.hasData) {
              return ListView(
                children: [
                  for (var item in snapshot.data!)
                    ListTile(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => DetailPage(user: item,),
                          ),
                        );
                      },
                      leading: CircleAvatar(
                        backgroundColor: Color(0xFF03203e),
                        child: Text("${item.id}"),
                      ),
                      title: Text(item.name),
                      subtitle: Text(item.email),
                    ),
                ],
              );
            } else if (snapshot.hasError) {
              return Text(snapshot.error.toString());
            } else {
              return Center(
                child: CircularProgressIndicator(),
              );
            }
          },
        ),
      ),
    );
  }
}
