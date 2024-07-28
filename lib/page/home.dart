import 'package:api/model/user.dart';
import 'package:api/services/user_api.dart';
import 'package:flutter/material.dart';

import '../model/user_name.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  //Variable pour récuperer les utilisateurs
  List<User> users = [];

  @override
  void initState() {
    super.initState();
     fetchUsers();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text('API'),
        ),
        backgroundColor: Colors.blue,
      ),
      body: ListView.builder(
        itemCount: users.length,
        itemBuilder: (context, index) {
          final user = users[index];
          final email = user.email;
          final color = user.gender == "male" ? Colors.blue : Colors.green;
          return ListTile(
            title: Text(user.fullName),
            subtitle: Image.network(user.picture.large),
          );
        }
      ),
    );
  }

  Future<void> fetchUsers() async {
    final response = await UserApi.fetchUsers();
    setState(() {
      users = response;
    });
  }
}







