import 'package:flutter/material.dart';
import 'package:untitled1newone/drawer/drawer.dart';
class Account extends StatefulWidget {
  const Account({Key? key}) : super(key: key);

  @override
  _AccountState createState() => _AccountState();
}

class _AccountState extends State<Account> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: DrawerWidget(),
      ),
      body: Text('account',),
    );
  }
}
